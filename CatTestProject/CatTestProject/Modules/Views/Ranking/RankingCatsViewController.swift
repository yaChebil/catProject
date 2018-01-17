//
//  RankingCatsViewController.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 17/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import UIKit
import iCarousel

class RankingCatsViewController: BaseViewController, iCarouselDataSource, iCarouselDelegate {
    
    //MARK: - Variables & Constants
    @IBOutlet var carousel: iCarousel!
    var rankedCatsArray: [Cat] = []
    

    //MARK: - UIViewController lifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set custom navigationBar style
        setNavigationBarTitleText(title: Constants.NavigationBarTitles.rankingScreenTitle, titlePadding: 150, fontName: "Didot-Bold", fontSize: 30, titlePosition: .center)
        
        //set leftBarButtonItem
        setNavigationBarButton(imageName: "button-back", selector: #selector(popToVoteScreen), isShown: true, isEnabled: true, isRightButton:false)
        
        //set dataSource & delegate as self(RankingCatsViewController)
        carousel.dataSource = self
        carousel.delegate = self
        //set carousel type
        carousel.type = .coverFlow
        
        //get stored array of cats on userDefaults
        var arrayFromUserDef : [Cat]
        arrayFromUserDef = Utils.getStoredCatsArray()
        rankedCatsArray = rankCats(array: arrayFromUserDef)
        carousel.reloadData()
    }
    
    @objc func popToVoteScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK:- Carousel Delegate & DataSource methods
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return rankedCatsArray.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
      
        //load our custom view from app bundle
        let rankItemView = Bundle.main.loadNibNamed("RankItemView", owner: self, options: nil)!.first as! RankItemView

        let cat = rankedCatsArray[index]
        //setup the rankItemView image/label
        rankItemView.catScoreLabel.text = "\(cat.catScore!) vote(s)"
        if let imageStringURL = cat.catImageUrl {
            rankItemView.catImageView.kf.indicatorType = .activity
            rankItemView.catImageView.kf.setImage(with: URL(string: imageStringURL))
        }
        
        return rankItemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
    
    //MARK:- Helpers
    
    func rankCats(array: [Cat]) -> [Cat] {
        
        let sortedArray = array.sorted(by: { $0.catScore! > $1.catScore! })
        return sortedArray
    }
    
}
