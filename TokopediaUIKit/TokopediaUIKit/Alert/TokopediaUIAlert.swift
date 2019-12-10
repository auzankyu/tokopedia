//
//  TokopediaUIAlert.swift
//  TokopediaUIKit
//
//  Created by Auzan Lazuardi on 06/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import UIKit

public class TokopediaUIAlert {
    public let alertController: UIAlertController!
    public let closeButton: UIAlertAction!
    
    init(alertTitle: String?, alertMessage: String?, buttonTitle: String? = "OK") {
        self.alertController = UIAlertController(title: alertTitle,
                                                 message: alertMessage,
                                                 preferredStyle: .alert)
        self.closeButton = UIAlertAction(title: buttonTitle,
                                         style: .cancel,
                                         handler: nil)
        
        self.alertController.addAction(self.closeButton)
    }
    
    public static func show(in viewController: UIViewController,
                            alertTitle: String?,
                            alertMessage: String?,
                            buttonTitle: String?) {
        let alert = TokopediaUIAlert(alertTitle: alertTitle,
                                          alertMessage: alertMessage,
                                          buttonTitle: buttonTitle)
        
        viewController.present(alert.alertController,
                               animated: true,
                               completion: nil)
    }
}

