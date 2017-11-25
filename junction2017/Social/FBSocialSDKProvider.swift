//
//  FBSocialSDKProvider.swift
//  junction2017
//
//  Created by Ostrenkiy on 25.11.2017.
//  Copyright © 2017 Ostrenkiy. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import PromiseKit

class FBSocialSDKProvider: SocialSDKProvider {
    
    public static let instance = FBSocialSDKProvider()
    
    let name = "facebook"
        
    func getAccessInfo() -> Promise<(token: String, email: String?)> {
        return Promise { fulfill, reject in
            let loginManager = FBSDKLoginManager()
            loginManager.logIn(withReadPermissions: ["email"], from: nil, handler: {
                result, error in
                if error != nil {
                    reject(SocialSDKError.connectionError)
                    return
                }
                guard let res = result else {
                    reject(SocialSDKError.connectionError)
                    return
                }
                
                if res.isCancelled {
                    reject(SocialSDKError.accessDenied)
                    return
                }
                if let t = res.token.tokenString {
                    fulfill((token: t, email: nil))
                    return
                }
            })
        }
    }
    
}

