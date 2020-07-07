//
//  CarService.swift
//  ios-mvp-swift
//
//  Created by 강주영 on 07/07/2020.
//  Copyright © 2020 ecubelabs. All rights reserved.
//

import Foundation

class CarService {
    public func getCars(onSuccess successCallback: ((_ result: [Car]) -> Void)?,
                        onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        let succeeded = true
        if (succeeded) {
            successCallback?([Car(name: "포르쉐", price: "엄청비싸")])
        } else {
            failureCallback?("faile")
        }
    }
}
