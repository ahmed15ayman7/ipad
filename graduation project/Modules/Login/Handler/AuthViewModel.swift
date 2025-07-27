import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject {
    @Published var chosenType: AccountType = .unchosen
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var errorMessage: String?
    @Published var isSignedIn: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var uid: String?
    @Published var hasFormError = false
    @Published var children: [User] = []
    
    private let db = Firestore.firestore()
    
    init() {
        checkCurrentUser()
    }
    
    // MARK: - Current User Check
    private func checkCurrentUser() {
        if let currentUser = Auth.auth().currentUser {
            getUserFromFirebase(uid: currentUser.uid)
        } else {
            getUserDataFromUserDefaults()
        }
    }
    
    // MARK: - Saving User Data
    private func saveUserData(uid: String, type: AccountType? = nil) {
        let userData: [String: Any] = [
            "name": name,
            "email": Auth.auth().currentUser?.email ?? "",
            "type": type?.rawValue ?? chosenType.rawValue
        ]
        
        db.collection("users").document(uid).setData(userData) { error in
            if let error = error {
                self.handleError(error)
            } else {
                print("User data successfully saved")
                self.saveToUserDefaults(userData: userData)
            }
        }
    }
    
    private func saveToUserDefaults(userData: [String: Any]) {
        UserDefaults.standard.set(userData["name"], forKey: "userName")
        UserDefaults.standard.set(userData["email"], forKey: "userEmail")
        UserDefaults.standard.set(userData["type"], forKey: "userType")
    }
    
    // MARK: - Get Current User
    func getCurrentUser() -> FirebaseAuth.User? {
        return Auth.auth().currentUser
    }
    
    // MARK: - Get User Data from Firestore
    func getUserFromFirebase(uid: String) {
        isLoading = true
        db.collection("users").document(uid).getDocument { document, error in
            self.isLoading = false
            if let error = error {
                self.handleError(error)
            } else if let document = document, document.exists, let data = document.data() {
                self.name = data["name"] as? String ?? ""
                self.email = data["email"] as? String ?? ""
                if let type = data["type"] as? String {
                    self.chosenType = AccountType(rawValue: type) ?? .unchosen
                }
                self.isSignedIn = true
                self.saveToUserDefaults(userData: data)
                print("User data successfully fetched from Firestore: \(data)")
            }
        }
    }
    
    // MARK: - Perform Sign Up or Sign In
    private func performAuthentication(isSignUp: Bool) {
        isLoading = true
        if isSignUp {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                self.isLoading = false
                if let error = error {
                    self.handleError(error)
                } else if let user = result?.user {
                    self.saveUserData(uid: user.uid)
                    self.isSignedIn = true
                    print("Successfully signed up!")
                }
            }
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                self.isLoading = false
                if let error = error {
                    self.handleError(error)
                } else if let user = result?.user {
                    self.getUserFromFirebase(uid: user.uid)
                    self.isSignedIn = true
                    print("Successfully signed in!")
                }
            }
        }
    }
    
    func performSignUp() {
        validate(isSignUp: true)
        if !hasFormError {
            performAuthentication(isSignUp: true)
        }
    }
    
    func performSignIn() {
        validate(isSignUp: false)
        if !hasFormError {
            performAuthentication(isSignUp: false)
        }
    }
    
    func createChildProfile(name: String, email: String, password: String) {
        validate(isSignUp: true)
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.hasError = true
                }
                print("Failed to sign up: \(error)")
            } else if let user = result?.user {
                self.saveUserData(uid: user.uid, type: .child)
                
                let newUser = User(uid: user.uid, email: email, name: name, accountType: .child, password: password)
                self.children.append(newUser)
                print("Successfully signed up!")
            }
        }
    }
    
//    func getChildrenFromFirebase() {
//        if   db.collection("users").document(uid).collection("children").getDocuments() < 4 {
//            createChildProfile(name: <#T##String#>, email: <#T##String#>, password: <#T##String#>)
//        } else {
//            return
//        }
//      
//    }
    
    // MARK: - Form Validation
    private func validate(isSignUp: Bool) {
        hasFormError = false
        errorMessage = nil
        if isSignUp && name.count < 3 {
            errorMessage = "Name must be at least 3 characters long."
            hasFormError = true
            return
        }
        if !email.contains("@") || email.count < 6 {
            errorMessage = "Please enter a valid email."
            hasFormError = true
        } else if password.count < 6 {
            errorMessage = "Password must be at least 6 characters long."
            hasFormError = true
        }
        hasError = hasFormError
    }
    
    // MARK: - Error Handling
    private func handleError(_ error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
            self.hasError = true
            self.isLoading = false
        }
        print("Error: \(error.localizedDescription)")
    }
    
    // MARK: - Sign Out
    func signOut() {
        do {
            try Auth.auth().signOut()
            name = ""
            password = ""
            email = ""
            chosenType = .unchosen
            isSignedIn = false
            clearUserData()
            print("Successfully signed out!")
        } catch {
            handleError(error)
        }
    }
    
    // MARK: - Clear User Data
    private func clearUserData() {
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "userEmail")
        UserDefaults.standard.removeObject(forKey: "userType")
        print("User data cleared from UserDefaults")
    }
    
    // MARK: - Fetch User Data from UserDefaults
    private func getUserDataFromUserDefaults() {
        if let name = UserDefaults.standard.string(forKey: "userName"),
           let email = UserDefaults.standard.string(forKey: "userEmail"),
           let type = UserDefaults.standard.string(forKey: "userType") {
            self.name = name
            self.email = email
            self.chosenType = AccountType(rawValue: type) ?? .unchosen
            self.isSignedIn = true
        }
    }
}
