//
//  TabItem.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 13/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation

/// Describes all tab bar items.
enum TabItem: Int, CaseIterable {
    case home
    case categories
    case search
    
    var title: String {
        switch self {
        case .home:
            return "Accueil"
        case .categories:
            return "Catégories"
        case .search:
            return "Recherche"
        }
        
    }
    var imgName: String {
        switch self {
        case .home:
            return "ic_home"
        case .categories:
            return "ic_categorie"
        case .search:
            return "ic_search"
        }
    }
}
