//
//  ExtensionVoteCuteCatViewController.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 15/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import UIKit


extension VoteCuteCatViewController {
    
    func setUpVSLabelStyles() {
        let strokeTextAttributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor: UIColor.white,
            NSAttributedStringKey.foregroundColor: UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1),
            NSAttributedStringKey.strokeWidth: -4.0,
            ]
        versusLabel.attributedText = NSAttributedString(string: "VS", attributes: strokeTextAttributes)
    }
    
    
    func addShapeMaskToTopImage() {
        firstCatImageView.layer.mask?.removeFromSuperlayer()
        let shapeLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: firstCatImageView.bounds.height - 10))
        path.addLine(to: CGPoint(x: firstCatImageView.bounds.width, y: firstCatImageView.bounds.height - 60))
        path.addLine(to: CGPoint(x: firstCatImageView.bounds.width, y: 0))
        path.closeSubpath()
        shapeLayer.path = path
        firstCatImageView.layer.addSublayer(shapeLayer)
        firstCatImageView.layer.mask = shapeLayer
    }
    
    func addShapeMaskToDownImage() {
        secondCatImageView.layer.mask?.removeFromSuperlayer()
        let shapeLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 60))
        path.addLine(to: CGPoint(x: 0, y: firstCatImageView.bounds.height))
        path.addLine(to: CGPoint(x: firstCatImageView.bounds.width, y: firstCatImageView.bounds.height))
        path.addLine(to: CGPoint(x: firstCatImageView.bounds.width, y: 10))
        path.closeSubpath()
        shapeLayer.path = path
        secondCatImageView.layer.addSublayer(shapeLayer)
        secondCatImageView.layer.mask = shapeLayer
    }
}
