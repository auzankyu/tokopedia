//
//  Splash.swift
//  Navigations
//
//  Created by Auzan Lazuardi on 29/11/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

public protocol SplashModuleProtocol {
    func splashScreen() -> UIViewController
}

extension Navigation {
    public var splashModule: SplashModuleProtocol {
        return resolve(SplashModuleProtocol.self)!
    }
}
