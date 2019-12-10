//
//  SplashVC.swift
//  Splash
//
//  Created by Auzan Lazuardi on 29/11/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import UIKit
import TokopediaUIKit
import Core

class SplashVC: UIViewController {

    var presenter: SplashViewToPresenter?
    
    public init() {
        super.init(nibName: "SplashVC", bundle: Bundle(for: SplashVC.self))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.presenter?.fetchHealthCheck()
        }
    }

    func setup() {
        let viewController = self
        var presenter: SplashViewToPresenter & SplashInteractorToPresenter = SplashPresenter()
        var interactor: SplashPresenterToInteractor = SplashInteractor()
        let router: SplashPresenterToRouter = SplashRouter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
    }
    
    func showAlert() {
        TokopediaUIAlert.show(in: self, alertTitle: AlertResponse.connectionError.errorTitle, alertMessage: AlertResponse.connectionError.errorMessage, buttonTitle: AlertResponse.errorButton)
    }
}

extension SplashVC: SplashPresenterToView {
    func showSuccess() {
        presenter?.navigateToHome(viewController: self)
    }
    
    func showError() {
        showAlert()
    }
}
