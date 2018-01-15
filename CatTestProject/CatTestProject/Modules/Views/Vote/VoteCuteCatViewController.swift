//
//  VoteCuteCatViewController.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 15/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class VoteCuteCatViewController: UIViewController {

    //MARK: - Variables & Constants
    @IBOutlet weak var firstCatImageView: UIImageView!
    @IBOutlet weak var secondCatImageView: UIImageView!
    
    var catsArray = [Cat]()
    var randomCatsArray  = [Cat]()
    
    
    //MARK: - UIViewController lifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //send request to get list of all cats from API
        getAllCatsRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK:- Networking & Request Callbacks
    
    func getAllCatsRequest() {
        
        let parameters: Parameters = [:]
        
        NetworkService.sharedInstance.sendDataFetchRequest(url: "https://latelier.co/data/cats.json",
            methodType: .get,
            params: parameters,
            urlEncoding: URLEncoding.default,
            headers: nil,
            callbackSuccess: successloadingCats,
            callbackFailure: failureLoadingCats)
    }
    
    func successloadingCats(jsonData: JSON) {
        
        catsArray = VoteService.fetchListOfCats(formattedJsonResponse: jsonData)
    }
    
    func failureLoadingCats(error: AFError) {
        
        print("API error")
    }
}
