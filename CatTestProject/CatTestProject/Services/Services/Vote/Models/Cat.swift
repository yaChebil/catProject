//
//  Cat.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 15/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import SwiftyJSON

class Cat: NSObject, NSCoding {
    
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
    
    required init?(coder aDecoder: NSCoder) {
        self.catId = aDecoder.decodeObject(forKey: "catId") as? String
        self.catImageUrl = aDecoder.decodeObject(forKey: "catImageUrl") as? String
        self.catScore = aDecoder.decodeObject(forKey: "catScore") as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(catId, forKey: "catId")
        aCoder.encode(catImageUrl, forKey: "catImageUrl")
        aCoder.encode(catScore, forKey: "catScore")
    }
}
