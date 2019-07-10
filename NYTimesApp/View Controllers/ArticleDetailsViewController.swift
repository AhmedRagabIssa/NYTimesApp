//
//  ArticleDetailsViewController.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleDetailsViewController: ParentViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImagesScrollView: UIScrollView!
    @IBOutlet weak var articleImagesPageController: UIPageControl!
    @IBOutlet weak var titleValueLabel: UILabel!
    @IBOutlet weak var abstractValueLabel: UILabel!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }

    override func displayData() {
        super.displayData()
        dateLabel.text = article?.publishedDate ?? "No Date Provided"
        
        DispatchQueue.main.async {
            self.addArticleImagesToTheScrollView(self.article?.gatImagesURLs())
            self.setupImagesPageController()
        }
        
        titleValueLabel.text = article?.title ?? "No title"
        abstractValueLabel.text = article?.abstract ?? "No abstract"
    }
    
    func addArticleImagesToTheScrollView(_ urls: [URL]?){

        for (idx, item) in (urls ?? []).enumerated(){
            let imageView = UIImageView()
            imageView.kf.setImage(with: item)
            imageView.contentMode = .scaleAspectFit
            let xPosition = articleImagesScrollView.frame.width * CGFloat(idx)
            imageView.frame = CGRect(x: xPosition, y: 0, width: articleImagesScrollView.frame.width, height: articleImagesScrollView.frame.height)

            articleImagesScrollView.contentSize.width = articleImagesScrollView.frame.width * CGFloat(idx + 1)
            articleImagesScrollView.addSubview(imageView)
        }
    }
    
    func setupImagesPageController() {
        // set the count of the images & the indecator colors to the page controller
        articleImagesPageController.numberOfPages = article?.gatImagesURLs().count ?? 0
        articleImagesPageController.currentPageIndicatorTintColor = UIColor.black
        articleImagesPageController.pageIndicatorTintColor = UIColor.lightGray
    }
}

extension ArticleDetailsViewController: UIScrollViewDelegate {
    // this is for setup the page controller with the article image scroll view
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // uptate the current page when the user scrolls on the scroll view
        let pageNumber = articleImagesScrollView.contentOffset.x / articleImagesScrollView.frame.size.width
        articleImagesPageController.currentPage = Int(pageNumber)
    }
}
