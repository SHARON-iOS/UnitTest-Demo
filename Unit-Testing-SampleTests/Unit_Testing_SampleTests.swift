//
//  Unit_Testing_SampleTests.swift
//  Unit-Testing-SampleTests
//
//  Created by SHARON D ROSE on 10/09/20.
//  Copyright © 2020 SHARON D ROSE. All rights reserved.
//

import XCTest
@testable import Unit_Testing_Sample

class Unit_Testing_SampleTests: XCTestCase {
    
    var loginModelTest: LoginViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        loginModelTest = LoginViewModel()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginViewModelStruct_canCreateNewInstance() {
        loginModelTest = LoginViewModel()
        
        XCTAssertNotNil(loginModelTest)
    }
    
    func testLoginModelUserNameShouldReturnTrueUserName() {
        let userName = "Tester"
        loginModelTest.userName = userName
        XCTAssertTrue(loginModelTest.isValidUserName())
    }
    
    func testLoginModelCheckEmptyFieldsShouldReturnFalseIfEmptyFieldExist() {
        loginModelTest = LoginViewModel(userName: "username", email: "test@dk.co", password: "", confirmPassword: "")
        XCTAssertFalse(loginModelTest.checkEmptyFields())
    }
    
    
    func testIsValidEmailShouldReturnFalseForIncorrectEmails() {
        let invalidEmail1 = "123@abc"
        loginModelTest.email = invalidEmail1
        let result1 = loginModelTest.isValidEmail()
        XCTAssertFalse(result1, "Positive result for invalid email")
        
        let invalidEmail2 = "abc.ru"
        loginModelTest.email = invalidEmail2
        let result2 = loginModelTest.isValidEmail()
        XCTAssertFalse(result2, "Positive result for invalid email")
    }
    
    func testIsValidEmailShouldReturnTrueForCorrectEmails() {
        let validEmail1 = "1a2b3c@abc.com"
        loginModelTest.email = validEmail1
        let result1 = loginModelTest.isValidEmail()
        XCTAssertTrue(result1, "Negative result for valid email")
        
        let validEmail2 = "test2_a@test.ru"
        loginModelTest.email = validEmail2
        let result2 = loginModelTest.isValidEmail()
        XCTAssertTrue(result2, "Negative result for valid email")
    }
    
    func testCheckValidPasswordShouldReturnCorrectWarningForShortPassword() {
        let shortPassword = "abc12"
        loginModelTest.password = shortPassword
        let result = loginModelTest.isValidPassword()
        XCTAssertEqual(result,
                       "Password must not be shorter than 6 characters",
                       "Incorrect result for short password")
    }
    
    func testCheckValidPasswordShouldReturnCorrectWarningForUppercaselessPass() {
        let uppercaselessPass = "abcdef"
        loginModelTest.password = uppercaselessPass
        let result = loginModelTest.isValidPassword()
        XCTAssertEqual(result,
                       "Password must contain at least one uppercase letter",
                       "Incorrect result for password without upeprcase")
    }
    
    func testCheckValidPasswordShouldReturnCorrectWarningForLowercaselessPass() {
        let lowercaselessPass = "PASSWORD"
        loginModelTest.password = lowercaselessPass
        let result = loginModelTest.isValidPassword()
        XCTAssertEqual(result,
                       "Password must contain at least one lowercase letter",
                       "Incorrect result for password without lowercase")
    }
    
    func testCheckValidPasswordShouldReturnCorrectWarningForNumberslessPass() {
        let numberslessPass = "Password"
        loginModelTest.password = numberslessPass
        let result = loginModelTest.isValidPassword()
        XCTAssertEqual(result,
                       "Password must contain at least one number",
                       "Incorrect result for password without numbers")
    }
    
    func testCheckValidPasswordShouldReturnNilForCorrectPassword() {
        let validPassword1 = "Abcd11"
        loginModelTest.password = validPassword1
        let result1 = loginModelTest.isValidPassword()
        XCTAssertNil(result1, "Incorrect result for correct password")
        
        let validPassword2 = "Password01"
        loginModelTest.password = validPassword2
        let result2 = loginModelTest.isValidPassword()
        XCTAssertNil(result2, "Incorrect result for correct password")
    }
    
    func testLoginModelDoPasswordsMatchShouldReturnTrueIfPaaswordMatch() {
        loginModelTest = LoginViewModel(userName: "username", email: "test@dk.co", password: "test", confirmPassword: "test")
        XCTAssertTrue(loginModelTest.doPasswordsMatch())
    }
    

}
