//
//  AddEditView.uitest.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/22/26.
//

import XCTest

class AddEditViewUITests: XCTestCase {
    
    func testAddBook() throws {
        let app = XCUIApplication()
        app.launch()
        // check count before adding the book
        let beforeAddingBookCount = app.collectionViews.firstMatch.cells.count
        // get the add book button and tap it
        let addBookButton = app.buttons["Add Book"]
        addBookButton.tap()
        // check the save button is disabled
        let saveButton = app.buttons["Save"]
        XCTAssert(!saveButton.isEnabled)
        // write into the title text field
        let titleTextField = app.textFields["Title Of The Book"]
        titleTextField.tap()
        titleTextField.typeText("Test Book \(beforeAddingBookCount)")
        // check if the save button is now enabled after writing into title
        XCTAssertTrue(saveButton.isEnabled)
        // save the book and check it increases the number of books avalible
        saveButton.tap()
        let afterAddingBookCount = app.collectionViews.firstMatch.cells.count
        XCTAssertEqual(afterAddingBookCount, beforeAddingBookCount + 1)
        print(app)
        
    }
}
