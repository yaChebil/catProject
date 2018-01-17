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


class VoteCuteCatViewController: BaseViewController {

    //MARK: - Variables & Constants
    @IBOutlet weak var firstCatImageView: UIImageView!
    @IBOutlet weak var secondCatImageView: UIImageView!
    @IBOutlet weak var versusLabel: UILabel!
    
    //array listing all cats from API
    var catsArray = [Cat]()
    //array which contains always 2 random cats
    var randomCatsArray  = [Cat]()
    
    
    //MARK: - UIViewController lifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //set custom navigationBar style
        setNavigationBarTitleText(title: "CATMASH", titlePadding: 150, fontName: "Didot-Bold", fontSize: 32, titlePosition: .center)
        
        //set rightBarButtonItem
        setNavigationBarButton(imageName: "button-ranking", selector: #selector(showRankingScreen), isShown: true, isEnabled: true, isRightButton:true)
        
        //set leftBarButtonItem
        setNavigationBarButton(imageName: "button-refresh", selector: #selector(searchNewCats), isShown: true, isEnabled: true, isRightButton:false)
        
        //send request to get list of all cats from API
        getAllCatsRequest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Draw shapeMask on firstCatImageView
        addShapeMaskToTopImage()
        //Draw shapeMask on secondCatImageView
        addShapeMaskToDownImage()
        //set pretty style to versusLabel
        setUpVSLabelStyles()
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
        
        //Store all new cats on UserDefaults so that we can start clean ranking
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "catsArray") == nil {
            userDefaults.setValue(NSKeyedArchiver.archivedData(withRootObject: catsArray), forKey: "catsArray")
            userDefaults.synchronize()
        }
        
        randomCatsArray = pickTwoDistinctCats(array: catsArray)
        setupUI()
    }
    
    func failureLoadingCats(error: AFError) {
        
        print("API error")
    }
    
    
    //MARK:- NavigationBar buttons methods
    
    @objc func showRankingScreen() {
        let rankingCatsViewController: RankingCatsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RankingCatsViewController") as! RankingCatsViewController
    
        self.navigationController?.pushViewController(rankingCatsViewController, animated: true)
    }
    
    @objc func searchNewCats() {
        randomCatsArray = pickTwoDistinctCats(array: catsArray)
        setupUI()
    }
    
    
    //MARK:- IBActions
    
    @IBAction func catImageTapped(sender: UITapGestureRecognizer) {
        let tag = sender.view?.tag
        print("Image Tapped with tag \(randomCatsArray[tag!].catId!)")
        
        
        //get stored array of cats on userDefaults
        var arrayFromUserDef : [Cat]
        let userDefaults = UserDefaults.standard
        arrayFromUserDef = NSKeyedUnarchiver.unarchiveObject(with: (userDefaults.object(forKey: "catsArray") as! NSData) as Data) as! [Cat]
       
        
        if let i = arrayFromUserDef.index(where: { $0.catId == randomCatsArray[tag!].catId! }) {
            let selectedCat = arrayFromUserDef[i]
            selectedCat.catScore = selectedCat.catScore! + 1
            
            arrayFromUserDef[i] = selectedCat
            userDefaults.setValue(NSKeyedArchiver.archivedData(withRootObject: arrayFromUserDef), forKey: "catsArray")
            userDefaults.synchronize()
            print("selected \(selectedCat.catScore!)")
        }
    }
    
    
    //MARK:- Helpers
    
    func pickTwoDistinctCats(array:[Cat]) -> [Cat] {
        
        var catViewsArray = [Cat]()
        
        let firstCat = array.randomElement()
        
        //unwrap optional var
        if let firstCat = firstCat {
            catViewsArray.append(firstCat)
        }
        
        var secondCat = array.randomElement()
        //loop until secondCat is different from the firstCat picked
        repeat {
            secondCat = array.randomElement()
        } while secondCat!.catId! == firstCat!.catId!
        
        //unwrap optional var
        if let secondCat = secondCat {
            catViewsArray.append(secondCat)
        }
        
        return catViewsArray
    }
    
    func setupUI() {

        if let imageStringURL = randomCatsArray[0].catImageUrl {
            firstCatImageView.kf.indicatorType = .activity
            firstCatImageView.kf.setImage(with: URL(string: imageStringURL))
        }
        
        if let imageStringURL = randomCatsArray[1].catImageUrl {
            secondCatImageView.kf.indicatorType = .activity
            secondCatImageView.kf.setImage(with: URL(string: imageStringURL))
        }
    }
    
}


