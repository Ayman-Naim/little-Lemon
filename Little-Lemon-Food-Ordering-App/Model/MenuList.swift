//
//  MenuList.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import Foundation
//
//  MenuList.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import Foundation
import CoreData

import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    

    
    //     mutating func getMenuData(viewContex:NSManagedObjectContext)async{
    //
    //        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
    //
    //        let request =  URLRequest(url: url!)
    //
    ////            let data =  URLSession.shared.dataTask(with: request) {
    ////                data , respond , error in
    ////                if let data = data {
    ////                    if let fullMenu = try? JSONDecoder().decode(JSONMenu.self, from: data){
    ////                        for dish in fullMenu.menu{
    ////                            let newDish =  Dish(context: viewContex)
    ////                            newDish.title  = dish.title
    ////                            newDish.price = dish.price
    ////                            newDish.image = dish.image
    ////                            newDish.category = dish.category
    ////                            newDish.descrioption = dish.description
    ////                        }
    ////                        try viewContex.save()
    ////                    }
    ////                    else{
    ////                        print(error.debugDescription)
    ////                    }
    ////                }else{
    ////                    print(error.debugDescription)
    ////                }
    ////            }
    ////
    ////         data.resume()
    ////
    ////
    //
    //
    //}
    
    
    
   static func getMenuData (coreDataContext : NSManagedObjectContext){
        PersistenceController.shared.clear()
       
              let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
              let request = URLRequest(url: url!)
              let session = URLSession.shared
              let dataTask = session.dataTask(with: request) { data, response, error in
                  if let data = data {
                     
                      let decoder = JSONDecoder()
                      if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                         
                          for dish in fullMenu.menu {
                              let newDish = Dish(context: coreDataContext)
                              newDish.title = dish.title
                              newDish.price = dish.price
                              newDish.descrioption = dish.descriptionDish
                              newDish.image = dish.image
                              newDish.category = dish.category
                          }
                          //print(fullMenu)
                          try? coreDataContext.save()
                      } else {
                          print(error.debugDescription.description)
                          print("1")
                      }
                  } else {
                      print(error.debugDescription.description)
                      print("3")
                  }
              }
              dataTask.resume()
    }
       
        
    }

