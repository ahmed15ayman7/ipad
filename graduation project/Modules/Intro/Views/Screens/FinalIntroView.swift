import SwiftUI

struct FinalIntroView: View {
    @State private var isActive = false // Controls navigation
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundWhite
                
                VStack {
                    Spacer()
                    Image("Blob")
                        .offset(y: 100)
                        .ignoresSafeArea()

                }
                .ignoresSafeArea()
                
                Image("MainBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Image("GraySine")
                        VStack {
                            Text("start your journey, and be ")
                                .font(.system(size: 25))
                                .foregroundStyle(.text)
                            Text("The Fittest")
                                .font(.system(size: 50))
                                .foregroundStyle(.text)
                                .bold()
                                .padding(.vertical)
                            Text("of them all")
                                .font(.system(size: 25))
                                .foregroundStyle(.text)
                        }
                    }
                    
                    Spacer()
                    RedButton(action: {
                        isActive = true
                    }, title: "Start")
                    .padding(.bottom, 100)
                    
                    .navigationDestination(isPresented: $isActive) {
                        ChooseView()
                            .environmentObject(authViewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    FinalIntroView()
}
