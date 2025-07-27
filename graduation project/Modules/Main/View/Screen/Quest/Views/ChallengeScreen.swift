import SwiftUI
import QuickPoseSwiftUI
import QuickPoseCore

struct ChallengeScreen: View {
    @EnvironmentObject var questViewModel: QuestViewModel
    @StateObject private var cameraManager = CameraManager.shared
    @State var count: Int = 0
    @State var isFinished = false
    @State private var navigateToNext: Bool = false
    @State private var showFinishScreen: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundWhite
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("Blob")
                        .offset(y: 100)
                }
                
                VStack(alignment: .leading) {
                    Text("iPad challenge 🎉")
                        .font(.system(size: 36))
                        .foregroundStyle(.text)
                    
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .foregroundStyle(.notSelected)
                    
                    HStack(spacing: 0) {
                        ForEach(questViewModel.exersices, id: \.id) { exercise in
                            StepIndicator(strokeColor: .mainRed,
                                          isActive: exercise.isDone,
                                          isLast: exercise == questViewModel.exersices.last)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    CameraView(count: $count, isFinished: $isFinished)
                        .environmentObject(questViewModel)
                        .padding(.vertical)
                    
                    
                    Spacer()
                }
                .navigationBarHidden(true)
                .padding()
            }
            .task {
                await cameraManager.checkAuthorizationStatus()
            }
        }
        .navigationDestination(isPresented: $isFinished) {
            if questViewModel.canMoveToNext() {
                NextChallenge()
                    .environmentObject(questViewModel)
            }
            else {
                FinishWeekScreen()
            }
            
        }
    }
}


#Preview {
    ChallengeScreen()
}
