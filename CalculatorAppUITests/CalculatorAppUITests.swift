//
//  CalculatorAppUITests.swift
//  CalculatorAppUITests
//
//  Created by 高橋 辰之 on 2019/04/05.
//  Copyright © 2019年 TatsuyukiTakahashi. All rights reserved.
//

import XCTest

class CalculatorAppUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {

        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {

        super.tearDown()
    }

    func testMoveCalcButton() {

        let btn = self.app.buttons["clear_btn"]
//        let button = XCUIApplication().buttons["clear_btn"]
        XCTAssertTrue(btn.exists)
        XCTAssertTrue(btn.isEnabled)
//        XCTContext.runActivity(named: "初期表示でTextViewの文言を確認") { (activity) in
//            waitToAppear(for: app.textViews["main_title"])
//            XCTAssertEqual(app.textViews["main_title"].value as? String, "計算機")
//        }
    }
}
