//
//  DataAppendTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 23.03.2022.
//  Copyright © 2022 Mikhail. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

class DataAppendTests: XCTestCase {

    private let fileManager = FileManager.default
    private lazy var fileURL = fileManager.temporaryDirectory.appendingPathComponent("DataAppendTest.txt")
    
    override func setUpWithError() throws {
        if fileManager.fileExists(atPath: fileURL.path) {
            try fileManager.removeItem(at: fileURL)
        }
    }

    override func tearDownWithError() throws {
        try fileManager.removeItem(at: fileURL)
    }

    func testDataAppend() throws {
        
        let encoding: String.Encoding = .utf8
        
        let originalText = "sometext"
        let originalData = try XCTUnwrap(originalText.data(using: encoding))
        try originalData.write(to: fileURL)
        
        let appendedText = "appendedtext"
        let appendedData = try XCTUnwrap(appendedText.data(using: encoding))
        try appendedData.append(toFileAt: fileURL)
        
        let fileData = try Data(contentsOf: fileURL)
        let fileText = try XCTUnwrap(String(data: fileData, encoding: encoding))
        
        XCTAssertEqual(fileText, "sometextappendedtext")
    }


}
