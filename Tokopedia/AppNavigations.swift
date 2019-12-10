//
//  AppNavigations.swift
//  Tokopedia
//
//  Created by Auzan Lazuardi on 29/11/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import Foundation
import Navigations
import Splash
import Product

func setDependencies() {
    let navigation = Navigation.shared
    
    navigation.register(SplashModuleProtocol.self) {
        return SplashModule()
    }
    
    navigation.register(ProductModuleProtocol.self) {
        return ProductModule()
    }
}
