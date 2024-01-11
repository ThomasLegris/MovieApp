//
//  ContentView+Utils.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 13/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import UIKit

/// Utility extension for content view.
extension ContentView {
    func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .none
        appearance.backgroundColor = UIColor(named: "background")
        // And use your config object
        if let font = UIFont(name: "SFProDisplay-Bold", size: 24) {
            appearance.titleTextAttributes = [.font: font,
                                              .foregroundColor: UIColor.white]
        }
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        let normalTabBarAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "SFProDisplay-Regular", size: 12) ?? .systemFont(ofSize: 11),
            .foregroundColor: UIColor.white
        ]
        let selectedTabBarAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "SFProDisplay-Bold", size: 13) ?? .boldSystemFont(ofSize: 12),
            .foregroundColor: UIColor(named: "light_green") ?? UIColor.black
        ]
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor(named: "background")?.withAlphaComponent(0.9)
            
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalTabBarAttributes
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedTabBarAttributes
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        } else {
            // UITabBar.appearance().shadowImage = UIImage()
            UITabBar.appearance().backgroundImage = UIImage()
            UITabBar.appearance().barStyle = .default
            UITabBar.appearance().isTranslucent = true
            UITabBar.appearance().backgroundColor = UIColor(named: "background")?.withAlphaComponent(0.9)
            // Fallback on earlier versions
            UITabBarItem.appearance().setTitleTextAttributes(selectedTabBarAttributes, for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes(selectedTabBarAttributes, for: .selected)
        }
    }
}
