//
//  RankingCatsViewController.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 17/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import UIKit
import iCarousel

class RankingCatsViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
   
    
    //MARK: - Variables & Constants
    @IBOutlet var carousel: iCarousel!
    var items: [Int] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0 ... 99 {
            items.append(i)
        }
    }
    
    
    //MARK: - UIViewController lifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.dataSource = self
        carousel.delegate = self
        carousel.type = .coverFlow2
    }
    
    
    //MARK:- Carousel Delegate & DataSource methods
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        var itemView: UIImageView
        
        let rankItemView = Bundle.main.loadNibNamed("RankItemView", owner: self, options: nil)!.first as! RankItemView
        rankItemView.catScoreLabel.text = "17 votes"
        
//        //reuse view if available, otherwise create a new view
//        if let view = view as? UIImageView {
//            itemView = view
//            //get a reference to the label in the recycled view
//            label = itemView.viewWithTag(1) as! UILabel
//        } else {
//            //don't do anything specific to the index within
//            //this `if ... else` statement because the view will be
//            //recycled and used with other index values later
//            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//            itemView.image = UIImage(named: "page.png")
//            itemView.contentMode = .center
//
//            label = UILabel(frame: itemView.bounds)
//            label.backgroundColor = .clear
//            label.textAlignment = .center
//            label.font = label.font.withSize(50)
//            label.tag = 1
//            itemView.addSubview(label)
//        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
       // label.text = "\(items[index])"
        
        return rankItemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
}
