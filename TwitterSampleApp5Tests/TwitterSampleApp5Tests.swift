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
        
        //ロングツイート　は　文字列（repeating:レピーディング　繰り返す　永遠のA,151カウント）
        //つまりロングツイートは文字列Aが151個の
        let longTweet = String(repeating: "A", count: 151)
        //@IBOutletしたviewとロングツイートを繋げた
//        vc.newTweetTextUITextView.text = longTweet
        //テスト結果が以下の条件の時テストは合格します。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　false(EditView.150字以上投稿不可（引数　投稿時のツイートテキストフォーマット: 変数151個の文字列A）)
        //要約　150以上入力不可の画面に151字の文字が渡されたので成り立たない。よってfalse テスト成功
        XCTAssertFalse(vc.isTweetText(tweetText: longTweet))
        
        
//        //TweetEditViewController.swiftのfunc isTweetTextで投稿ができると判断されたらそれぞれのテキストが表示される
//        XCTAssertTrue(vc.isTweetText(tweetText: "ツイートする内容"))
//        XCTAssertFalse(vc.isTweetText(tweetText: "150字以上は投稿できません"))
        
        }
    }


//チャットGPTのコード
//
//テストキャラクター限界超え
//func TweetEditViewController() {
//
//    //マックスツイートレングス　MAXの文章の長さ
//    var maxTweetLength = 150
//    //UITextFieldを呼び出して maxLengthTextField としている
//    let maxLengthTextField = UITextField()
//
//    //文字数制限の判定を行う関数
//    //チェックキャラクターリミット　引数名:ストリング型　ブール型を返す
//    //この条件がTrueであれば true を返し、条件が False であれば false を返し、文字数が制限を超えていると判断します。
//    func checkCharacterLimit(_ tweetText: String) -> Bool {
//        //count を用いて、文字列内の文字数を取得 つまり149文字以内
//
//        return tweetText.count <= maxTweetLength
//    }
//    //テキストフィールドの変更時に呼ばれるメソッド
//    //テキストフィールドディドゥチェンジセレクション
//    func textFieldDidChangeSelection(textField: UITextField) {
//        //ガードレッド文とは　オプショナルバインディング型で、nilの場合は中断。textField.text が nil でない場合tweetText にその値を代入　通常エルスをセットで使う
//        guard let tweetText = textField.text else { return }
//
//        //文字数制限の判定  ツイートの文字数が制限を超えている場合に if ブロック内のコードが実行されます。
//        if !checkCharacterLimit(tweetText) {
//            //ツイートの文字数が制限を超えている場合、アラートを表示するための関数 showAlert を呼び出しています。    この関数は、指定されたメッセージを使ってユーザーに警告や通知を表示するものと考えられます。
//            showAlert(message: "ツイートは\(maxTweetLength)文字以内で入力してください")
//            //文字数制限を超えた場合、ツイートを制限の範囲内に収める
//            textField.text = String(tweetText.prefix(maxTweetLength))
//        }
//    }
//}















