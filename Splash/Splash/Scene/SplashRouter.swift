//
//  SplashRouter.swift
//  Splash
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit
import Navigations

class SplashRouter: SplashPresenterToRouter {
    func navigateToHome(viewController: UIViewController) {
        let module = Navigation.shared.productListModule
        let screen = module.productListScreen()
        viewController.navigationController?.pushViewController(screen, animated: true)
    }
}
