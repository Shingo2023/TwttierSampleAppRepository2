//
//  TwitterSampleApp5Tests.swift
//  TwitterSampleApp5Tests
//
//  Created by 高橋真悟 on 2024/01/05.
//

//import XCTest
//@testable import TwitterSampleApp5
//
//final class TwitterSampleApp5Tests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
//構想
//スイッチ分
//
//エルス節}{ 150文字以上で投稿できません
//    falseの時に使えるように？
//
//
//警告を出すコードと切り捨てるコード

    import UIKit

    class ViewController: UIViewController {

        @IBOutlet private weak var maxLengthTextField: UITextField!
        //ランチ：長さ
        private let maxtextLength = 150

        override func viewDidLoad() {
            super.viewDidLoad()
            maxLengthTextField.delegate = self
        }
    }

    extension ViewController: UITextFieldDelegate {

        func textFieldDidChangeSelection(_ textField: UITextField) {
            //ガード分 特定の条件が満たされているかどうかを確認し、条件が満たされていない場合にエラーを投げるためのもの
            guard var tweetText = maxLengthTextField.text else { return }

            if tweetText.count > maxLength {
                // 最大文字数超えた場合は切り捨て
                overText = String(password.prefix(maxPasswordLength))
            }
            // 文字列から全角半角スペースを取り除く
            passwordTextField.text = password.removingWhiteSpace()
        }





























