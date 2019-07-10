//
//  NYTimesAppUITests.swift
//  NYTimesAppUITests
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import XCTest

class NYTimesAppUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationFromListingToDetails() {
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["10 Findings That Contradict Medical Wisdom. Doctors, Take Note."]/*[[".cells.staticTexts[\"10 Findings That Contradict Medical Wisdom. Doctors, Take Note.\"]",".staticTexts[\"10 Findings That Contradict Medical Wisdom. Doctors, Take Note.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.scrollViews.children(matching: .other).element.swipeLeft()
        elementsQuery.children(matching: .scrollView).element.swipeRight()
    }
    
    func testArticlesDetailsDateLabelExist() {
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["10 Findings That Contradict Medical Wisdom. Doctors, Take Note."]/*[[".cells.staticTexts[\"10 Findings That Contradict Medical Wisdom. Doctors, Take Note.\"]",".staticTexts[\"10 Findings That Contradict Medical Wisdom. Doctors, Take Note.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let dateLabel = elementsQuery.staticTexts["2019-07-01"]
        XCTAssert(dateLabel.exists, "The date label dose not exist.")
    }
    
    func testBackFromDetailsToListing() {
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["10 Findings That Contradict Medical Wisdom. Doctors, Take Note."]/*[[".cells.staticTexts[\"10 Findings That Contradict Medical Wisdom. Doctors, Take Note.\"]",".staticTexts[\"10 Findings That Contradict Medical Wisdom. Doctors, Take Note.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let nytimesArticlesNavigationBar = app.navigationBars["NYTimes Articles"]
        nytimesArticlesNavigationBar.buttons["NYTimes Articles"].tap()
        let nav = nytimesArticlesNavigationBar.otherElements["NYTimes Articles"]
        XCTAssert(nav.exists, "The Listing navigation bar dose not exist.")
    }
    
}
