//
//  Home.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        MainScreen().navigationBarBackButtonHidden(true)
//        TabView{
//            Menu()
//                .tabItem({
//                    Label("Menu",systemImage: "list.dash")
//                })
//            UserProfile().tabItem({
//                Label("Profile",systemImage: "square.and.pencil")
//            })
//       }
//        .navigationBarBackButtonHidden(true)
   }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
