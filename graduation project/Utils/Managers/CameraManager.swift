//
//  CameraManager.swift
//  graduation project
//
//  Created by mazen eldeeb on 19/09/2024.
//

import Foundation
import AVFoundation

@MainActor
class CameraManager: ObservableObject {
    static let shared = CameraManager()
    
    private init() {}
    
    @Published var isAuthorized: Bool = false
    
    func checkAuthorizationStatus() async {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        var authorized = status == .authorized
        if status == .notDetermined {
            authorized = await AVCaptureDevice.requestAccess(for: .video)
        }
        
        DispatchQueue.main.async {
            self.isAuthorized = authorized
        }
    }

}
