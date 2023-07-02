//
//  Onboarding.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import SwiftUI

struct Onboarding: View {
    @StateObject private var viewModele = viewModel()
    @State var firstName  :String = ""
    @State var lastName  :String = ""
    @State var email  :String = ""
    @State var isLoggedIn = false
    @State var alert  = false
    
    var body: some View   {
        
        
        NavigationStack{
            ScrollView{
                VStack{
                    Header()
                    Hero().padding()
                        .frame(maxWidth: .infinity, maxHeight: 240)
                        .background(Color("primary1"))
                      
                Spacer(minLength: 90)
                    VStack(spacing: 15){
                        
                        
                        NavigationLink(destination: Home(),isActive: $isLoggedIn){
                            
                        }
                        HStack {
                            Text("First Name *  :")
                            TextField("Enter First Name", text: $firstName)
                        }
                        HStack{
                            Text("Last Name *  :")
                            TextField("Enter Last Name", text: $lastName )
                        }
                        HStack{
                            Text("Email Name *  :")
                            TextField("Enter Email Name", text: $email)
                        }
                        
                        
                        Button("Register"){
                            if viewModele.TextFieldsValidation(firstName: firstName, lastName: lastName, email: email){
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                UserDefaults.standard.set(lastName  , forKey: kLastName )
                                UserDefaults.standard.set(email, forKey: kEamil)
                                UserDefaults.standard.set(true, forKey: kIsLogedIn)
                                UserDefaults.standard.set(true, forKey: kOrderStatuses)
                                UserDefaults.standard.set(true, forKey: kPasswordChanges)
                                 UserDefaults.standard.set(true, forKey: kSpecialOffers)
                                 UserDefaults.standard.set(true, forKey: kNewsletter)
                                isLoggedIn = true
                                firstName = ""
                                lastName = ""
                                email = ""
                                
                            }
                            else{
                                alert = true
                            }
                            
                        }.buttonStyle(.bordered)
                        Spacer()
                            .alert(isPresented:$alert){
                                Alert(title: Text("Registarion Error"),message: Text(viewModele.errorMessage),dismissButton: .cancel())
                            }
                    }
                    
                }.onAppear(){
                    if UserDefaults.standard.bool(forKey: kIsLogedIn){
                        isLoggedIn = true
                    }
                }
                .padding()
                
                
            }
            
        }.navigationBarBackButtonHidden()
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
