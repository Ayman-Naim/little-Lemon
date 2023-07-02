//
//  UserProfile.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import SwiftUI

struct UserProfile: View {
    @StateObject private var model = viewModel()
    @Environment(\.presentationMode) var presentation
    @State private var firstName  = ""
    @State private var lastName  = ""
    @State private var email  = ""
    @State private var isLoggedOut = false
    
   
    @State private var orderStatuses = true
        @State private var passwordChanges = true
        @State private var specialOffers = true
        @State private var newsletter = true
    
    var body: some View {
        ScrollView{
        NavigationLink(destination: Onboarding(), isActive: $isLoggedOut)
        {
        }
            
            VStack(spacing: 5) {
                VStack {
                    Text("Avatar")
                    
                    HStack(spacing: 0) {
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Button("Change") { }
                            .buttonStyle(.bordered)
                        Button("Remove") { }
                            .buttonStyle(.bordered)
                        Spacer()
                    }
                }
                
                HStack{
                    Text("First name")
                    
                    TextField("fgf", text: $firstName)
                    
                }
                
                HStack {
                    Text("Last name")
                    
                    TextField("Last Name", text:$lastName)
                    
                }
                
                HStack {
                    Text("E-mail       ")
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            
            Text("Email notifications")
                .font(.regularText())
                .foregroundColor(Color( "primary1"))
            VStack {
                Toggle("Order statuses", isOn: $orderStatuses)
                Toggle("Password changes", isOn: $passwordChanges)
                Toggle("Special offers", isOn: $specialOffers)
                Toggle("Newsletter", isOn: $newsletter)
            }
            .padding()
            .font(Font.leadText())
            .foregroundColor(Color( "primary1"))
            
            Button("Log out") {
                UserDefaults.standard.set(false, forKey: kIsLogedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEamil)
                
                UserDefaults.standard.set(false, forKey: kOrderStatuses)
                UserDefaults.standard.set(false, forKey: kPasswordChanges)
                UserDefaults.standard.set(false, forKey: kSpecialOffers)
                UserDefaults.standard.set(false, forKey: kNewsletter)
                isLoggedOut = true
            }
            .buttonStyle(.bordered)
            Spacer(minLength: 20)
            HStack {
                Button("Discard Changes") {
                    firstName = model.firstName
                    lastName = model.lastName
                    email = model.email
                    
                    
                    orderStatuses = model.orderStatuses
                    passwordChanges = model.passwordChanges
                    specialOffers = model.specialOffers
                    newsletter = model.newsletter
                    self.presentation.wrappedValue.dismiss()
                }
                .buttonStyle(.bordered)
                Button("Save changes") {
                    if model.TextFieldsValidation(firstName: firstName, lastName: lastName, email: email) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEamil)
                        
                        UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                .buttonStyle(.bordered)
            }
            if model.errorMessageShow {
                withAnimation() {
                    Text(model.errorMessage)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
            
        }
    .onAppear {
        firstName = model.firstName
        lastName = model.lastName
        email = model.email
        orderStatuses = model.orderStatuses
        passwordChanges = model.passwordChanges
        specialOffers = model.specialOffers
        newsletter = model.newsletter
}
               .navigationTitle(Text("Personal information"))
               .navigationBarTitleDisplayMode(.inline)
           }

}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
