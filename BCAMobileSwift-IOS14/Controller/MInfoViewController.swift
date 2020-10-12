//
//  MInfoViewController.swift
//  BCAMobileSwift-IOS14
//
//  Created by Jlius Suweno on 11/10/20.
//

import UIKit

class MInfoViewController: UIViewController {

    @IBOutlet weak var mInfoTableView: UITableView!
    
    var propsModel = PropertiesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mInfoTableView.delegate = self
        mInfoTableView.dataSource = self
        
        mInfoTableView.layer.cornerRadius = 10
        mInfoTableView.layer.borderColor = UIColor(red: 0.0/255.0, green: 74.0/255.0, blue: 173.0/255.0, alpha: 1).cgColor
        mInfoTableView.layer.borderWidth = 2
    }

}

extension MInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return propsModel.minfoHeader.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return propsModel.minfoHeader[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberRow = 0
        if section == 0 {
            numberRow = propsModel.minfoList[section].count
        } else if section == 1 {
            numberRow = propsModel.minfoList[section].count
        } else if section == 2 {
            numberRow = propsModel.minfoList[section].count
        } else if section == 3 {
            numberRow = propsModel.minfoList[section].count
        } else if section == 4 {
            numberRow = propsModel.minfoList[section].count
        }
        return numberRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mInfoTableView.dequeueReusableCell(withIdentifier: "minfoCell", for: indexPath)
        cell.textLabel?.text = propsModel.minfoList[indexPath.section][indexPath.row]
        return cell
    }
    
    
}
