//
//  CarPresenter.swift
//  ios-mvp-swift
//
//  Created by 강주영 on 07/07/2020.
//  Copyright © 2020 ecubelabs. All rights reserved.
//

import Foundation

struct Car {
    let name: String
    let price: String
}

protocol CarListView: NSObjectProtocol {
    func drive(_ cars: [Car])
    func stop()
}

class CarPresenter {
    private let carService: CarService
    weak private var carListView: CarListView?
    
    init(carService: CarService) {
        self.carService = carService
    }
    
    func attachView(view:CarListView) {
        self.carListView = view
    }
    
    func detachView() {
        self.carListView = nil
    }
    
    func drive() {
        self.carService.getCars(onSuccess: { (array) in
            self.carListView?.drive(array)
        }, onFailure: { (message) in
            print("message: \(message)")
        })
    }
    
    func fetch() {
        
    }
}
