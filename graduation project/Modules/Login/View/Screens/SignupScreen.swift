import SwiftUI

struct SignupScreen: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @FocusState private var current: FieldType?
    
    var body: some View {
        ZStack {
            Color.backgroundWhite.ignoresSafeArea()
            VStack {
                Spacer()
                Image("Blob")
                    .resizable()
                    .frame(maxHeight: 300)
                    .edgesIgnoringSafeArea(.all)
                    .offset(y: 100)

            }
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("LaunchScreen")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                    Spacer()
                }
                Rectangle()
                    .foregroundStyle(.notSelected)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .padding(.bottom, 50)
                Text("Sign up")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundStyle(.mainRed)
                    .padding(.bottom, 16)
                Text("Welcome to FitQuest")
                    .font(.system(size: 20))
                    .foregroundStyle(Color(red: 75/255, green: 87/255, blue: 104/255))
                    .padding(.bottom)
                
                LoginTextField(
                    title: "Name",
                    keyboardType: .alphabet,
                    text: $authViewModel.name,
                    focusedField: $current
                )
                LoginTextField(
                    title: "Email",
                    keyboardType: .emailAddress,
                    text: $authViewModel.email,
                    focusedField: $current
                )
                LoginTextField(
                    title: "Password",
                    isSecure: true,
                    keyboardType: .alphabet,
                    text: $authViewModel.password,
                    focusedField: $current
                )
                
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        if authViewModel.isLoading {
                            ProgressView().foregroundStyle(.mainRed)
                        } else {
                            RedButton(action: {
                                authViewModel.performSignUp()
                            }, title: "Signup")
                            .navigationDestination(isPresented: $authViewModel.isSignedIn) {
                                MainView()
                                    .environmentObject(authViewModel)
                            }
                            
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                }
                Spacer()
            }
            .padding()
        }
        .navigationBarHidden(true)
        .removeFocusOnTap()
        .alert(isPresented: $authViewModel.hasError) {
            Alert(title: Text("Error"), message: Text(authViewModel.errorMessage ?? "An unknown error occurred"), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    SignupScreen()
}
