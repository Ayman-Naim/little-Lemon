//
//  Menu.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 02/07/2023.
//

import SwiftUI

struct Menu: View {
    
      @Environment(\.managedObjectContext) private var viewContext
      @State var startersIsEnabled = true
      @State var mainsIsEnabled = true
      @State var dessertsIsEnabled = true
      @State var drinksIsEnabled = true
      @State var searchText = ""
    
    
    
    @State var loaded = false
    
    @State var isKeyboardVisible = false
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    if !isKeyboardVisible{
                        withAnimation()
                        {
                            Hero().frame(maxHeight: 180)
                            
                        }
                    }
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .frame(alignment: .center)
                          
                        TextField("Search menu",text: $searchText).textFieldStyle(.roundedBorder)
                    }
                    .padding([.top,.bottom],2)
                    .padding(.leading,5)
                    .background(Color.white)
                    .cornerRadius(5)
                   
                }
                .padding()
                .background(Color("primary1"))
                Text("Order For Delivery!")
                    .font(.sectionTitle())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                ScrollView(.horizontal){
                    HStack(spacing: 20){
                       
                        Button{
                             
                            startersIsEnabled .toggle()
                        }label: {
                            
                            Text("Starters")
                                .font(.sectionCategories())
                                .foregroundColor(.black)
                        }
                            .background(Color("colorB")).buttonStyle(.bordered).cornerRadius(15)
                        Button{
                            
                            mainsIsEnabled.toggle()
                        }label: {
                            
                            Text("Mains")
                                .font(.sectionCategories())
                                .foregroundColor(.black)
                        }.background(Color("colorB")).buttonStyle(.bordered).cornerRadius(15)
                        
                        Button{
                            
                            dessertsIsEnabled.toggle()
                        }label: {
                            
                            Text("Dessert")
                                .font(.sectionCategories())
                                .foregroundColor(.black)
                        }.background(Color("colorB")).buttonStyle(.bordered).cornerRadius(15)
                        
                        Button{
                            
                            drinksIsEnabled.toggle()
                        }label: {
                            
                            Text("Drinks")
                                .font(.sectionCategories())
                                .foregroundColor(.black)
                        }.background(Color("colorB")).buttonStyle(.bordered).cornerRadius(15)
                        
                    }
                  
                    .padding(.horizontal)
                    
                }
                    
                FetchedObjects(
                    predicate: buildpredicate(),
                    sortDescriptors: buildSordDescriptor()){
                        (dishes: [Dish]) in
                        List(dishes){
                            dish in
                            NavigationLink(destination:  DetailItem(dish: dish)){
                                FoodItem(dish: dish)
                            }
                            
                            
                            
                        }.listStyle(.plain)
                        
                    }
                
                
            }.onAppear{
                if !loaded{
                    MenuList.getMenuData(coreDataContext: viewContext)
                    loaded = true 
                }
            }
            
            
            
        }
    }
    
    func  buildpredicate () ->NSCompoundPredicate{
        let search = searchText == "" ? NSPredicate(value: true): NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
             let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
             let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)
        let compoundPredicates = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
               return compoundPredicates
        
    }
    func buildSordDescriptor () -> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
        
       
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
