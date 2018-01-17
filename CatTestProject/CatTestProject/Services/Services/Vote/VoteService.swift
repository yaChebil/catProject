//
//  VoteService.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 15/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import SwiftyJSON


class VoteService {
    
    static func fetchListOfCats(formattedJsonResponse:JSON) -> [Cat] {
        
        var catsArray: [Cat] = [Cat]()
        
        let catJsonArray = formattedJsonResponse[Constants.AppModels.Cat.images]
    
        for aCatObject in catJsonArray.arrayValue {
            
            let newCat: Cat = Cat(jsonObject: aCatObject)
            catsArray.append(newCat)
        }
        
        return catsArray
    }
}
