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
        self.continueAfterFailure = false
        self.app.launch()
    }

    override func tearDown() {

        super.tearDown()
    }

    func testClearCalcButton() {

        let btn = self.app.buttons["clear_btn"]
        XCTAssertTrue(btn.exists)
        XCTAssertTrue(btn.isEnabled)
        XCTAssertEqual(btn.label, "C")
//        XCTContext.runActivity(named: "初期表示でTextViewの文言を確認") { (activity) in
//            waitToAppear(for: app.textViews["main_title"])
//            XCTAssertEqual(app.textViews["main_title"].value as? String, "計算機")
//        }
        btn.tap()
    }
}
