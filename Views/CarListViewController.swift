//
//  CarListViewController.swift
//  ios-mvp-swift
//
//  Created by 강주영 on 07/07/2020.
//  Copyright © 2020 ecubelabs. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
}

class CarListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = CarPresenter(carService: CarService())
    var carToDisplay = [Car]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = self
        
        self.presenter.attachView(view: self)
        self.presenter.drive()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension CarListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: indexPath) as! CarTableViewCell
        let viewData = carToDisplay[indexPath.row]
        cell.labelTitle?.text = viewData.name
        cell.labelSubtitle?.text = viewData.price
        return cell
    }
}

extension CarListViewController: CarListView {
    func drive(_ cars: [Car]) {
        carToDisplay = cars
        tableView?.isHidden = false
        tableView?.reloadData()
    }
    
    func stop() {
        tableView?.isHidden = true
    }
}
