//
//  InstanceBeforeTests.swift
//  iOSHookTests
//
//  Created by Yanni Wang on 14/10/19.
//  Copyright © 2019 Yanni. All rights reserved.
//

import XCTest
import iOSHook

class InstanceBeforeTests: XCTestCase {
    
    func testOneInstance() {
        var error: Error? = nil
        let obj = TestObject()
        var triggered = false
        obj.hookBefore(selector: #selector(TestObject.simpleMethod), onlyOnce: false, error:&error, block: {(obj, args) in
            triggered = true
        })
        XCTAssert(error == nil)
        XCTAssert(triggered == false)
        obj.simpleMethod()
        //        XCTAssert(triggered == true)
    }
    
    func testAllInstance() {
        var error: Error? = nil
        var triggered = false
        TestObject.hookBeforeForAllInstances(selector: #selector(TestObject.simpleMethod), onlyOnce: false, error:&error, block: {(obj, args) in
            triggered = true
        })
        XCTAssert(error == nil)
        XCTAssert(triggered == false)
        TestObject().simpleMethod()
        //            XCTAssert(triggered == true)
    }
    
    func testClass() {
        var error: Error? = nil
        var triggered = false
        TestObject.hookBeforeForClass(selector: #selector(TestObject.simpleMethod), onlyOnce: false, error:&error, block: {(obj, args) in
            triggered = true
        })
        XCTAssert(error == nil)
        XCTAssert(triggered == false)
        TestObject().simpleMethod()
        //            XCTAssert(triggered == true)
    }
    
}
