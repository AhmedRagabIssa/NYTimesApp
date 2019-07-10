//
//  NYTimesAppTests.swift
//  NYTimesAppTests
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import XCTest
@testable import NYTimesApp

class NYTimesAppTests: XCTestCase {

    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testArticlesLoading() {
        NetworkManager.requestMostPopularArticles { (articles, error) in
            XCTAssertNil(error, "There was an error while loading the articles from the server.")
            XCTAssertNotNil(articles, "No articles recived form the server.")
            
            let firstArticle = articles?.first
            let thumbnailURLStr = firstArticle?.getThumbnailURLStr()
            
            XCTAssertNotNil(thumbnailURLStr, "The Article Thumbnail ie equal nil.")
            
            let articlesImagesURLs = firstArticle?.gatImagesURLs()
            XCTAssert(articlesImagesURLs?.count ?? -1 > 0, "The Article dosent have any Images URLs.")
        }
        
        NetworkManager.requestMostPopularArticles(forLastDays: 50, using: NetworkManager()) { (articles, error) in
            XCTAssertNotNil(error, "There is no error while loading the articles from the server using wrong days interval.")
            XCTAssertNil(articles, "Articles recived form the server using wrong wrong days interval.")
        }
        
        NetworkManager.requestMostPopularArticles("", forLastDays: 50, using: NetworkManager()) { (articles, error) in
            XCTAssertNotNil(error, "There is no error while loading the articles from the server using wrong URL & wrong days interval.")
            XCTAssertNil(articles, "Articles recived form the server using wrong URL & wrong days interval.")
        }
        
        NetworkManager.requestMostPopularArticles("تست", forLastDays: 7, using: NetworkManager()) { (articles, error) in
            XCTAssertNotNil(error, "There is no error while loading the articles from the server using wrong URL.")
            XCTAssertNil(articles, "Articles recived form the server using wrong URL.")
        }
    }
    
    func testMainStoryboard() {
        XCTAssertNotNil(mainStoryboard, "Cannot instantiate main storyboard")
    }
    
    func testArticleCell() {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "listing") as? MostPopularListingViewController
        
        _ = viewController?.view
        
        
        let articleCell = viewController?.articlesTableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reusableIdentifier) as? ArticleTableViewCell
        
        XCTAssertNotNil(articleCell, "Cannot dequeue article cell")
        
        let articleCellFailed = viewController?.articlesTableView.dequeueReusableCell(withIdentifier: "wrong identifier") as? ArticleTableViewCell
        
        XCTAssertNil(articleCellFailed, "Can dequeue article cell with wrong identifier")

    }
    
    func testArticlesListingViewController() {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "listing") as? MostPopularListingViewController
        
        _ = viewController?.view
        
        viewController?.performSegue(withIdentifier: "goToDetails", sender: nil)
    }
    
    func testArticleDetailsViewController() {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "details") as? ArticleDetailsViewController
        XCTAssertNotNil(viewController, "Cannot instantiate ArticleDetailsViewController")
        _ = viewController?.view
        
        if let url = URL(string: "https://static01.nyt.com/images/2018/06/04/us/05xp-graduation2/05xp-graduation2-thumbStandard.jpg") {
            let urls: [URL] = [url]
            
            viewController?.addArticleImagesToTheScrollView(urls)
            
            XCTAssert(viewController?.articleImagesScrollView.contentSize.width != 0, "Articles Images scroll view content width = 0 while having an image.")
        }
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
