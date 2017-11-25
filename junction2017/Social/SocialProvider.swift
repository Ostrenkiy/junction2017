//
//  SocialProvider.swift
//  junction2017
//
//  Created by Ostrenkiy on 25.11.2017.
//  Copyright © 2017 Ostrenkiy. All rights reserved.
//

import Foundation
import PromiseKit

protocol SocialSDKProvider {
    var name: String { get }
    func getAccessInfo() -> Promise<(token: String, email: String?)>
}

enum SocialSDKError: Error {
    case connectionError, accessDenied
}
