//
//  PropertiesModel.swift
//  BCAMobileSwift-IOS14
//
//  Created by Jlius Suweno on 10/10/20.
//

import Foundation


//MARK: - Declare Properties Here
struct PropertiesModel {
    let buttonSegue = ["aboutSegue", "mbcaSegue", "klikbcaSegue", "infobcaSegue", "bukarekeningbaruSegue", "gantikodeaksesSegue", "flazzSegue"]
    let homeButtonSegue = ["infoSegue", "transferSegue", "paymentSegue", "commerceSegue", "cardlessSegue", "adminSegue", "keyboardSegue", "flazzSegue", "bagibagiSegue"]
    
    let user = UserModel(idUser: 1, nameUser: "JLIUS SUWENO", accessCodeUser: "Jeje12", pinUser: "123456")
    
    let nameButton = ["m-BCA", "KlikBCA", "Info BCA"]
    
    let cellIdButton = "buttonTableViewCell"
    
    let minfoHeader = ["m-Info", "Info Reksadana", "Info RDN", "Info KPR", "Info Kartu Kredit"]
    let minfoList = [["Info Saldo", "Mutasi Rekening", "Rekening Deposito", "Info Reward BCA"],
                     ["NAB Reksadana", "Saldo Reksadana", "Info Kurs"],
                     ["Info Saldo", "Mutasi Rekening"],
                     ["Inquiry Pinjaman"],
                     ["Saldo", "Transaksi", "Lainnya", "Inbox"]]
    
    let mtransferHeader = ["Daftar Transfer", "Transfer"]
    let mtransferList = [["Antar Rekening", "Antar Bank"],
                        ["Antar Rekening", "Antar Bank", "BCA Virtual Account", "Sakuku", "Sakuku Transaksi Sakuku", "Inbox"]]
    
    let mpaymentHeader = ["m-Payment"]
    let mpaymentList = ["Kartu Kredit", "Handphone", "Telephone", "Publik / Utilitas", "BPJS", "Asuransi", "Internet", "Pinjaman", "Lainnya", "Inbox" ]
    
    let mcommerceHeader = ["m-Commerce"]
    let mcommerceList = ["Voucher Isi Ulang", "PLN Prabayar", "PLN Manual Advice", "Lainnya", "Inbox"]
    
    let madminHeader = ["m-Admin", "Koneksi Kartu Kredit", "e-Statement Kartu Kredit", "Aktivasi Kartu Kredit", "Hapus Daftar"]
    let madminList = [["Ganti PIN", "Atur OneKlik", "Atur Kuasa Debet", "Blokir Kartu Kredit", "Kontrol Kartu Kredit", "Request Limit Kartu Kredit"],
                    ["Daftar", "Hapus"],
                    ["Daftar", "Request Ulang", "Reset Password"],
                    ["Aktivasi Kartu", "Buat/Ubah PIN"],
                    ["Transfer Antar Rekening", "Transfer Antar Bank", "Transfer BCA Virtual Account", "Transfer Sakuku", "Pembayaran", "Pembelian"]]
    
    
    
    
}
