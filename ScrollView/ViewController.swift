//
//  ViewController.swift
//  ScrollView
//
//  Created by Appinventiv Technologies on 20/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var featurePageControl: UIPageControl!
    @IBOutlet weak var featureScrollView: UIScrollView!
    
    let feature1 = ["title": "Apple Watch", "price": "$2.99", "image": "1"]
    let feature2 = ["title": "More Design", "price": "$6.91", "image": "2"]
    let feature3 = ["title": "Notification", "price": "$5.99", "image": "3"]
    
    var featureArray = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featureScrollView.delegate = self
        
        featureArray = [feature1, feature2, feature3]
        featureScrollView.isPagingEnabled = true
        featureScrollView.contentSize = CGSize(width: self.view.bounds.width *
                                    CGFloat(featureArray.count), height: 250)
        
        featureScrollView.showsHorizontalScrollIndicator = false
        loadFeature()
    }
    
    func loadFeature() {
        for (index, feature) in featureArray.enumerated(){
            if let featureView = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? FeatureView {
                featureView.featureImageView.image = UIImage(named: feature["image"]!)
                featureView.titleLabel.text = feature["title"]
                featureView.priceLabel.text = feature["price"]
                
                featureScrollView.addSubview(featureView)
                featureView.frame.size.width = self.view.bounds.size.width
                featureView.frame.origin.x = CGFloat(index) * self.view.frame.size.width
            }
        }
    }
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        featurePageControl.currentPage = Int(page)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

