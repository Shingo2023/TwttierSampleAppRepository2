//
//  TwitterSampleApp5Tests.swift
//  TwitterSampleApp5Tests
//
//  Created by 高橋真悟 on 2024/01/05.
//


//清書のコード

import XCTest
import UIKit
//TwitterSampleApp5の中にあるクラスを読み込みたいのでこのような書き方になる
@testable import TwitterSampleApp5
//XCTestCaseは、テストケースを作成するための基本クラスであり、このクラスを継承してテストメソッドやテストサポートメソッドを追加できます。 このクラス内でテスト対象のコードが呼び出され、期待される結果と比較されます。
//テスト指定メソッドを呼び出してXCTestCaseを使って期待した結果になっているか確認します
class TwitterSampleApp5Tests: XCTestCase {
    //throws スロウ　投げる
    //テストキャラクターリミット　テストする関数なのでtestと記述してある
    func testCharacterLimit() throws {
        //文字数制限のテストをしたいので、編集を行うViewControllerを指定しています。
        //TweetEditViewControllerのインスタンスをしている
        let vc = TweetEditViewController()
        
        //直訳　ロングツイート　は　文字列（repeating:レピーディング　繰り返す　永遠のA,151カウント）
        //要約　つまりロングツイートは文字列Aが151個
        let longTweet = String(repeating: "A", count: 151)
        //直訳　アラートfalse 151字以上でture それ以下はfalse ツイート文151文字
        //要約　isTweetText が true なので 成立　＝　テスト成功する
        XCTAssertFalse(vc.isTweetText(tweetText: longTweet))
        
        //ジャストツイート　文字列（繰り返すA、150個）
        let justTweet = String(repeating: "A", count: 150)
        //直訳　アラートtrue 150字以上でture それ以下はfalse ツイート文151字
        //要約　isTweetText が false なので 不成立　＝　テスト失敗する
        XCTAssertTrue(vc.isTweetText(tweetText: justTweet))
        
        //isTweetTextは150字以上でture それ以下はfalseを出す関数
        
        }
    }














