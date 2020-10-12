//
//  User.swift
//  BCAMobileSwift-IOS14
//
//  Created by Jlius Suweno on 10/10/20.
//

import Foundation

struct UserModel {
    
    var idUser: Int
    var nameUser: String
    var accessCodeUser: String
    var pinUser: String
    
    init(idUser: Int, nameUser: String, accessCodeUser: String, pinUser: String) {
        self.idUser = idUser
        self.nameUser = nameUser
        self.accessCodeUser = accessCodeUser
        self.pinUser = pinUser
    }
}
