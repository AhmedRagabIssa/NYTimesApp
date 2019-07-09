//
//  ViewController.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var articlesDataSource: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.requestMostPopularArticles { (articles, error) in
            self.articlesDataSource = articles ?? []
        }
    }

}

