//
//  HomeViewController.swift
//  BCAMobileSwift-IOS14
//
//  Created by Jlius Suweno on 10/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Props
    @IBOutlet weak var mInfoButton: UIButton!
    @IBOutlet weak var mTransferButton: UIButton!
    @IBOutlet weak var mPaymentButton: UIButton!
    @IBOutlet weak var mCommerceButton: UIButton!
    @IBOutlet weak var cardlessButton: UIButton!
    @IBOutlet weak var mAdminButton: UIButton!
    @IBOutlet weak var bcaKeyboardButton: UIButton!
    @IBOutlet weak var flazzButton: UIButton!
    @IBOutlet weak var bagibagiButton: UIButton!
    @IBOutlet weak var namaLabel: UILabel!
    
    var propsModel = PropertiesModel()
    
    //MARK: - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDesignButton()
    }
    
    //MARK: - Custom Methods
    func initDesignButton() {
        let arrayButton = [ mInfoButton, mTransferButton, mPaymentButton, mCommerceButton, cardlessButton,
                            mAdminButton, bcaKeyboardButton,
                            flazzButton,
                            bagibagiButton
        ]
        
        for item in arrayButton {
            item?.layer.cornerRadius = 20
            item?.clipsToBounds = true
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: propsModel.homeButtonSegue[sender.tag], sender: self)
    }
}
