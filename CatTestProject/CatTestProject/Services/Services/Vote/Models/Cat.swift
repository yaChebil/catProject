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
        
        if let catId = jsonObject[Constants.AppModels.Cat.catId].string  {
            self.catId = catId
        }
        
        if let catImageUrl = jsonObject[Constants.AppModels.Cat.catImageUrl].string  {
            self.catImageUrl = catImageUrl
        }
        
        self.catScore = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.catId = aDecoder.decodeObject(forKey: Constants.AppModels.Cat.catId) as? String
        self.catImageUrl = aDecoder.decodeObject(forKey: Constants.AppModels.Cat.catImageUrl) as? String
        self.catScore = aDecoder.decodeObject(forKey: Constants.AppModels.Cat.catScore) as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(catId, forKey: Constants.AppModels.Cat.catId)
        aCoder.encode(catImageUrl, forKey: Constants.AppModels.Cat.catImageUrl)
        aCoder.encode(catScore, forKey: Constants.AppModels.Cat.catScore)
    }
}
