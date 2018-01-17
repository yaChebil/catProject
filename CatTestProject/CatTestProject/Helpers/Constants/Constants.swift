//
//  Constants.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 17/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import Foundation

class Constants {
    
    struct ApiUrls {
        static let catListAPI = "https://latelier.co/data/cats.json"
    }
    
    struct NavigationBarTitles {
        
        static let voteScreenTitle = "CATMASH"
        static let rankingScreenTitle = "LEADER BOARD"
    }
    
    struct AppModels {
        
        struct Cat {
            static let catId         = "id"
            static let catImageUrl   = "url"
            static let catScore      = "score"
            static let images        = "images"
        }
    }
    
}

