//
//  Apex_ForzaApp.swift
//  Apex Forza
//
//  Created by Leonardo Figueiredo on 22/03/26.
//

import SwiftUI

@main
struct Apex_ForzaApp: App {
    init() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithTransparentBackground()
        navigationAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
