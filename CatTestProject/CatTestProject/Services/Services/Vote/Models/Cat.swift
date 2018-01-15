//
//  Cat.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 15/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import SwiftyJSON

class Cat: NSObject {
    
    var catId: String?
    var catImageUrl: String?
    var catScore: Int?
    
    override init() {}
    
    init(jsonObject:JSON){
        
        if let catId = jsonObject["id"].string  {
            self.catId = catId
        }
        
        if let catImageUrl = jsonObject["url"].string  {
            self.catImageUrl = catImageUrl
        }
        
        self.catScore = 0
    }
}
