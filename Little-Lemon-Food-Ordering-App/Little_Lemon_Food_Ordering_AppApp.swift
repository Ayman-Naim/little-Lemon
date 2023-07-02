//
//  Little_Lemon_Food_Ordering_AppApp.swift
//  Little-Lemon-Food-Ordering-App
//
//  Created by ayman on 30/06/2023.
//

import SwiftUI

@main
struct Little_Lemon_Food_Ordering_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
