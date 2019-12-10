//
//  SplashInteractor.swift
//  Splash
//
//  Created by Auzan Lazuardi on 10/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import RxSwift

class SplashInteractor: SplashPresenterToInteractor {
    var presenter: SplashInteractorToPresenter?
    var worker: SplashWorker?
    
    func fetchHealthCheck() {
        worker = SplashWorker()
        worker?.fetchHealthCheck()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { (result) in
                self.presenter?.noticeFetchSuccess()
            }, onError: { (_) in
                self.presenter?.noticeFetchFailed()
            })
    }
}
