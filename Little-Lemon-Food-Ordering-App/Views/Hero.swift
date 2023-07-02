//
//  Hero.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("Little Lemon")
                        .foregroundColor(Color("primary2"))
                        .font(.displayFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                   
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.subTitleFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    //Spacer(minLength: 3)
                    Text("""
                         We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                         """)
                    .foregroundColor(.white)
                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack{
                    Spacer(minLength: 2)
                    Image("Hero-image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 120, maxHeight: 120)
                        .clipShape(Rectangle())
                        .cornerRadius(16)
                }
            }
        }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
