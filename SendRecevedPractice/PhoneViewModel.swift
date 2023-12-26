//
//  WatchViewModel.swift
//  SendRecevedPractice Watch App
//
//  Created by 広瀬友哉 on 2023/12/26.
//

import WatchConnectivity

class PhoneViewModel: NSObject, ObservableObject, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        Task { @MainActor in
            if let value = message["msg"] as? String {
                self.message = value
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
    
    func send(messages: String){
        guard session.activationState == .activated else {
            print("Sending method an only be called while the session is .activ")
            return
        }
        
        Task.detached(priority: .medium) { [self] in
            
            let userInfo = [
                "msg": messages
            ] as [String: Any]
            
            session.transferUserInfo(userInfo)
        }
    }
    
}
