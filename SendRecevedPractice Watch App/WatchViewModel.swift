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
    
    
    private let session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        self.session.activate()
    }
    
}
