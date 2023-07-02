//
//  Header.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import SwiftUI

struct Header: View {
    @State var isLogedIn = false
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Image("Logo")
                    HStack{
                        Spacer()
                        if isLogedIn{
                            NavigationLink(destination:UserProfile()){
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: 50)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                        }
                    }
                }
            }
            .frame(maxHeight: 60)
            .padding(.bottom)
        }.onAppear(){
            if UserDefaults.standard.bool(forKey: kIsLogedIn){
                isLogedIn = true
            }
            else
            {
                isLogedIn = false
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
