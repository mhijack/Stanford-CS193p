//
//  Stanford_CS193pApp.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

@main
struct Stanford_CS193pApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
