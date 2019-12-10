//
//  SplashProtocols.swift
//  Splash
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

protocol SplashViewToPresenter {
    var router: SplashPresenterToRouter? {set get}
    var interactor: SplashPresenterToInteractor? {set get}
    var view: SplashPresenterToView? {set get}
    
    func fetchHealthCheck()
    func navigateToHome(viewController: UIViewController)
}

protocol SplashPresenterToView {
    func showSuccess()
    func showError()
}

protocol SplashPresenterToInteractor {
    var presenter: SplashInteractorToPresenter? {set get}
    func fetchHealthCheck()
}

protocol SplashInteractorToPresenter {
    func noticeFetchSuccess()
    func noticeFetchFailed()
}

protocol SplashPresenterToRouter {
    func navigateToHome(viewController: UIViewController)
}
