//
//  SplashModule.swift
//  Splash
//
//  Created by Auzan Lazuardi on 29/11/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit
import Navigations

public class SplashModule: SplashModuleProtocol {
    public init() {}
    
    public func splashScreen() -> UIViewController {
        return SplashVC()
    }
}
