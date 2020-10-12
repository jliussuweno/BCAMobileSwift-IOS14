//
//  ViewController.swift
//  BCAMobileSwift-IOS14
//
//  Created by Jlius Suweno on 10/10/20.
//

import UIKit

var activeUser = [UserModel]()

class LandingViewController: UIViewController {
    //MARK: - Props
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var mBCAButton: UIButton!
    @IBOutlet weak var klikBCAButton: UIButton!
    @IBOutlet weak var infoBCAButton: UIButton!
    @IBOutlet weak var bukaRekeningBaruButton: UIButton!
    @IBOutlet weak var gantiKodeAksesButton: UIButton!
    @IBOutlet weak var flazzButton: UIButton!
    @IBOutlet weak var buttonTableView: UITableView!
    
    var databaseBrain = DatabaseBrain()
    var propertiesModel = PropertiesModel()
    var kodeAkses = ""
    
    //MARK: - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseBrain.initDB()
        databaseBrain.deleteSavedDataUser()
        databaseBrain.createTableUser()
        databaseBrain.saveDBValueUser(inputData: propertiesModel.user)
        activeUser = databaseBrain.readDBValueUser()
        initDesignButton()
        buttonTableView.delegate = self
        buttonTableView.dataSource = self
        buttonTableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: propertiesModel.cellIdButton)
        buttonTableView.isScrollEnabled = false
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlertLogin()
        } else if sender.tag == 2{
            UIApplication.shared.open(NSURL(string: "https://m.klikbca.com/login.jsp")! as URL)
        } else if (sender.tag == 3){
            UIApplication.shared.open(NSURL(string: "https://www.bca.co.id/promo?i=008f9c1b75462c608c04981bb197b89f90e4b7dff76ed9002aec60c8911bff16")! as URL)
        } else if (sender.tag == 4){
            showAlertPemrek()
        } else if (sender.tag == 6){
            showAlertFlazz()
        } else {
            self.performSegue(withIdentifier: propertiesModel.buttonSegue[sender.tag], sender: self)
        }
    }
    
    func initDesignButton() {
        bukaRekeningBaruButton.layer.cornerRadius = 10
        bukaRekeningBaruButton.clipsToBounds = true
        gantiKodeAksesButton.layer.cornerRadius = 10
        gantiKodeAksesButton.clipsToBounds = true
        flazzButton.layer.cornerRadius = 10
        flazzButton.clipsToBounds = true
        mBCAButton.roundedButtonTop()
        mBCAButton.layer.borderWidth = 2
        mBCAButton.layer.borderColor = UIColor.white.cgColor
        
        mBCAButton.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        
        
        klikBCAButton.layer.borderWidth = 1
        klikBCAButton.layer.borderColor = UIColor.white.cgColor
        infoBCAButton.layer.borderWidth = 1
        infoBCAButton.layer.borderColor = UIColor.white.cgColor
        infoBCAButton.roundedButtonBottom()
        
        buttonTableView.layer.cornerRadius = 10
        buttonTableView.layer.borderColor = UIColor(red: 0.0/255.0, green: 74.0/255.0, blue: 173.0/255.0, alpha: 1).cgColor
        buttonTableView.layer.borderWidth = 2
        
    }
    
    func showAlertLogin(){
        let alert = UIAlertController(title: "Kode Akses", message: nil , preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Input 6 alphanum"
            textField.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { [weak alert] (_) in
            guard let textField = alert?.textFields?[0], let _ = textField.text else { return }
            self.kodeAkses = textField.text!
            if self.kodeAkses == activeUser[0].accessCodeUser {
                self.performSegue(withIdentifier: self.propertiesModel.buttonSegue[1], sender: nil)
            } else if self.kodeAkses.count < 6 {
                self.showAlertFailed()
            } else if self.kodeAkses.count == 6 {
                self.showAlertNotFound()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertFailed(){
        let alert = UIAlertController(title: nil, message: "107 - Kode Akses harus 6 karakter dengan kombinasi huruf dan angka." , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertNotFound(){
        let alert = UIAlertController(title: nil, message: "Kode Akses Anda salah." , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertPemrek(){
        let alert = UIAlertController(title: "m-BCA", message: "Untuk membuka rekening baru, gunakan no HP yang belum memiliki fasilitas BCA mobile.\n Info lebih lanjut hubungi Halo BCA di 1500888" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertFlazz(){
        let alert = UIAlertController(title: nil , message: "Maaf, ponsel Anda tidak mendukung fitur NFC." , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UIButton{
    func roundedButtonTop(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .topRight],
                                     cornerRadii: CGSize(width: 10, height: 10))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func roundedButtonBottom(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomLeft , .bottomRight],
                                     cornerRadii: CGSize(width: 10, height: 10))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func setInsets( forContentPadding contentPadding: UIEdgeInsets, imageTitlePadding: CGFloat){
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding)
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding)
    }
}

extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertiesModel.nameButton.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: propertiesModel.cellIdButton) as! ButtonTableViewCell
        cell.titleLabel.text = propertiesModel.nameButton[indexPath.row]
        cell.buttonImageView.layer.cornerRadius = 10
        cell.buttonImageView.layer.masksToBounds = true
        cell.buttonImageView.layer.borderWidth = 0.2
        cell.buttonImageView.layer.borderColor = UIColor(red: 0.0/255.0, green: 74.0/255.0, blue: 173.0/255.0, alpha: 1).cgColor
        cell.layer.borderColor = UIColor(red: 0.0/255.0, green: 74.0/255.0, blue: 173.0/255.0, alpha: 1).cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            showAlertLogin()
        } else if indexPath.row == 1 {
            UIApplication.shared.open(NSURL(string: "https://m.klikbca.com/login.jsp")! as URL)
        } else if indexPath.row == 2 {
            UIApplication.shared.open(NSURL(string: "https://www.bca.co.id/promo?i=008f9c1b75462c608c04981bb197b89f90e4b7dff76ed9002aec60c8911bff16")! as URL)
        }
    }
}

//MARK: - UITextField
extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                                    CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

//MARK: - UITextFieldDelegate
extension LandingViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Harus diisi"
            return false
        }
    }
}
