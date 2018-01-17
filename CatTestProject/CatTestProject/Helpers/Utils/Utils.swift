//
//  Utils.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 17/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import Foundation

class Utils {
    
    static func getStoredCatsArray() -> [Cat] {
        
        var storedArray : [Cat]
        let userDefaults = UserDefaults.standard
        storedArray = NSKeyedUnarchiver.unarchiveObject(with: (userDefaults.object(forKey: "catsArray") as! NSData) as Data) as! [Cat]
        
        return storedArray
    }
    
    static func updateStoredCatsArray(with newCats: [Cat]) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(NSKeyedArchiver.archivedData(withRootObject: newCats), forKey: "catsArray")
        userDefaults.synchronize()
    }
    
    
    
}
