//
//  SplashPresenter.swift
//  Splash
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

class SplashPresenter: SplashViewToPresenter {
    var router: SplashPresenterToRouter?
    var interactor: SplashPresenterToInteractor?
    var view: SplashPresenterToView?
    
    func fetchHealthCheck() {
        interactor?.fetchHealthCheck()
    }
    
    func navigateToHome(viewController: UIViewController) {
        router?.navigateToHome(viewController: viewController)
    }
}

extension SplashPresenter: SplashInteractorToPresenter {
    func noticeFetchSuccess() {
        view?.showSuccess()
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
}
