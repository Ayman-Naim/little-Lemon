//
//  viewModel.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import Foundation


public let kFirstName = "first name key"
public let kLastName = "second name key "
public let kEamil = "first email "
public let kIsLogedIn = "is loged in key "

public let kOrderStatuses = "order statuses key"
public let kPasswordChanges = "password changes key"
public let kSpecialOffers = "special offers key"
public let kNewsletter = "news letter key"



class viewModel : ObservableObject{
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEamil) ?? ""
    @Published var errorMessageShow = false
      @Published var errorMessage = ""

    
     @Published var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
     @Published var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
     @Published var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
     @Published var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    
    func TextFieldsValidation(firstName:String , lastName: String , email : String)->Bool{
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else{
            errorMessage = "all fields must be Enterd with data"
            errorMessageShow = true
            return false
        
        }
        errorMessageShow = false
        errorMessage = ""
        return true
      
        
    }
}
