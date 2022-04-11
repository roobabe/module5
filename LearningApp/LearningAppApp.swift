//
//  LearningApp.swift
//  LearningApp
//
//  Created by Kynda Montero-Langston on 4/10/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
