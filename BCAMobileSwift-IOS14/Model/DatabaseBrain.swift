//
//  DatabaseBrain.swift
//  BCAMobileSwift-IOS14
//
//  Created by Jlius Suweno on 10/10/20.
//

import Foundation
import UIKit
import SQLite3

class DatabaseBrain: NSObject {
    var db: OpaquePointer?
    
    @objc func initDB(){
        let fileURL = try! FileManager.default.url(for: .documentDirectory , in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("database.sqlite")
        
        //Open Database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("ERROR - Error while open Database")
        } else {
            print("SUCCESS - Open Database done")
        }
        
    }
    
    @objc func createTableUser(){
        //Create Table
        let  createTableQuery = "CREATE TABLE IF NOT EXISTS User (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, accesscode TEXT, pin TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error while create Table - \(errMsg)")
        } else {
            print("SUCCESS - Create Table done")
        }
    }
    
    @objc func deleteSavedDataUser(){
        let deleteQuery = "DROP TABLE User"
        if sqlite3_exec(db, deleteQuery, nil, nil, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error while delete Table - \(errMsg)")
        } else {
            print("SUCCESS - Delete Table done")
        }
    }
    
    func saveDBValueUser(inputData: UserModel){
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        var statement: OpaquePointer?
        let name = inputData.nameUser
        let accesscode = inputData.accessCodeUser
        let pin = inputData.pinUser
        
        let insertQuery = "INSERT INTO User (name, accesscode, pin) VALUES (?, ?, ?)"
        
        if sqlite3_prepare(db, insertQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error while Prepare Insert - \(errMsg)")
            return
        } else {
            print("SUCCESS - Prepare Insert done")
        }
        
        if sqlite3_bind_text(statement, 1, name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error Binding Statement 1 - \(errMsg)")
            return
        } else {
            print("SUCCESS - Binding Statement 1 done")
        }
        
        if sqlite3_bind_text(statement, 2, accesscode, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error Binding Statement 2 - \(errMsg)")
            return
        } else {
            print("SUCCESS - Binding Statement 2 done")
        }
        
        if sqlite3_bind_text(statement, 3, pin, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error Binding Statement 3 - \(errMsg)")
            return
        } else {
            print("SUCCESS - Binding Statement 3 done")
        }
        
        if sqlite3_step(statement) != SQLITE_DONE {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error Insert Statement - \(errMsg)")
            return
        } else {
            print("SUCCESS - Insert Statement done")
        }
    }
    
    func readDBValueAccessCode(inputData: UserModel) -> [UserModel] {
        var userList = [UserModel]()
        let selectQuery = "SELECT * FROM User Where accesscode = \'\(inputData.accessCodeUser)\' "
        var statement: OpaquePointer?
        
        if sqlite3_prepare(db, selectQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error while Prepare Select - \(errMsg)")
        } else {
            print("SUCCESS - Prepare Select done")
        }
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            let id = Int(sqlite3_column_int(statement, 0))
            let name = String(cString: sqlite3_column_text(statement, 1))
            let accessCode = String(cString: sqlite3_column_text(statement, 2))
            let pin = String(cString: sqlite3_column_text(statement, 3))
            
            userList.append(UserModel(idUser: id, nameUser: name, accessCodeUser: accessCode, pinUser: pin))
        }
        
        return userList
    }
    
    func readDBValueLogin(inputData: UserModel) -> [UserModel] {
        var userList = [UserModel]()
        let selectQuery = "SELECT * FROM User Where accesscode = \'\(inputData.accessCodeUser)\' "
        var statement: OpaquePointer?
        
        if sqlite3_prepare(db, selectQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error while Prepare Select - \(errMsg)")
        } else {
            print("SUCCESS - Prepare Select done")
        }
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            let id = Int(sqlite3_column_int(statement, 0))
            let name = String(cString: sqlite3_column_text(statement, 1))
            let accessCode = String(cString: sqlite3_column_text(statement, 2))
            let pin = String(cString: sqlite3_column_text(statement, 3))
            
            userList.append(UserModel(idUser: id, nameUser: name, accessCodeUser: accessCode, pinUser: pin))
        }
        
        return userList
    }
    
    func readDBValueUser() -> [UserModel] {
        var userList = [UserModel]()
        let selectQuery = "SELECT * FROM User"
        var statement: OpaquePointer?
        
        if sqlite3_prepare(db, selectQuery, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("ERROR - Error while Prepare Select - \(errMsg)")
        } else {
            print("SUCCESS - Prepare Select done")
        }
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            let id = Int(sqlite3_column_int(statement, 0))
            let name = String(cString: sqlite3_column_text(statement, 1))
            let accessCode = String(cString: sqlite3_column_text(statement, 2))
            let pin = String(cString: sqlite3_column_text(statement, 3))
            
            userList.append(UserModel(idUser: id, nameUser: name, accessCodeUser: accessCode, pinUser: pin))
        }
        
        return userList
    }
}

