import SwiftUI
import QuickPoseCore
import QuickPoseSwiftUI

struct CameraView: View {
    @Binding var count: Int
    @Binding var isFinished: Bool
    @EnvironmentObject var questViewModel: QuestViewModel
    var quickPose = QuickPose(sdkKey: "01J85QFRZSCSEQJE57QASXGVTV")
    @State private var overlayImage: UIImage?
    @State private var counter = QuickPoseThresholdCounter(enterThreshold: 0.8, exitThreshold: 0.5)
    @State private var outOfView = false
    @State private var temp = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            QuickPoseCameraView(useFrontCamera: true, delegate: quickPose)
            QuickPoseOverlayView(overlayImage: $overlayImage)
            
            // Count Display
            HStack {
                Spacer()
                Text("\(count)")
                    .foregroundStyle(.text)
                    .padding()
                    .background(Color.backgroundWhite)
                    .clipShape(Circle())
                    .padding(.trailing)
            }
        }
        .overlay {
            if outOfView {
                OutOfViewOverlay()
            }
        }
        .onAppear {
            temp = 0
            UIApplication.shared.isIdleTimerDisabled = true
            startQuickPose()
        }
        .onDisappear {
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
    
    private func startQuickPose() {
        quickPose.disableLogging()
        quickPose.start(features: questViewModel.getCurrentExercise().features, onFrame: { status, image, features, feedback, landmarks in
            switch status {
            case .success:
                overlayImage = image
                outOfView = false
                if let result = features.values.first {
                    print(result.value)
                    count = counter.count(result.value).count
                    if temp != count {
                        questViewModel.playSound()
                        temp = count
                    }
                    if count == questViewModel.getCurrentExercise().numberOfSets {
                        questViewModel.exersices[questViewModel.currentIndex].finished()
                        isFinished = true
                    }
                }
            case .noPersonFound:
                outOfView = true
            case .sdkValidationError:
                print("Be back soon")
            }
        })
    }
}

private struct OutOfViewOverlay: View {
    var body: some View {
        ZStack {
            Color.red.opacity(0.3)
            Text("Please step into view")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}
