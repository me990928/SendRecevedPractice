//
//  WatchViewModel.swift
//  SendRecevedPractice Watch App
//
//  Created by 広瀬友哉 on 2023/12/26.
//

import SwiftUI
import WatchConnectivity

final class WatchViewModel: NSObject, ObservableObject, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        Task {
            @MainActor in
            
            if let value = userInfo["count"] as? Int {
                counter = value
            } else {
                counter = 0
            }
            
            if let value = userInfo["message"] as? String {
                message = value
            } else {
                message = "None"
            }
        }
    }
    
    
    
    private let session: WCSession
    
    @Published var message: String = ""
    
    @Published var counter: Int = 0
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        self.session.activate()
    }
    
    func countUp() {
        counter += 1
        sendImmediately()
    }
    
    func sendImmediately(){
        guard session.activationState == .activated else {
            print("Sending method an only be called while the session is .activ")
            return
        }
        
        Task.detached(priority: .medium) { [self] in
            
            let message = [
                "count": counter
            ] as [String: Any]
            
            self.session.sendMessage(message, replyHandler: nil){ error in
                print(error)
            }
            
        }
    }
    
}
