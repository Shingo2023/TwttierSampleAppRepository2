//
//  TweetEditViewController.swift
//  TwitterSampleApp5
//
//  Created by 高橋真悟 on 2024/01/08.
//

import Foundation
import UIKit
//サブクラス画面遷移後の内容をまとめて書く
class TweetEditViewController: UIViewController {
    @IBOutlet weak var newTweetText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didTapDone()//
        setDoneButton()

    }
    
    func setDoneButton() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        let commitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        toolBar.items = [commitButton]
        
        newTweetText.inputAccessoryView = toolBar
    }
    @objc func didTapDone() {
        let newtweetDataModel = TweetDataModel(userName: "ユーザー名",recordDate: Date(), tweetText:"これは新しいツイート文です。")
        
        let displayText: String = """
 \(newtweetDataModel.userName)\(newtweetDataModel.recordDate)\(newtweetDataModel.tweetText)
"""
        //キーボードを閉じるためのメソッド
        view.endEditing(true)
        newTweetText.text = displayText
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ビューが表示されたときにキーボードを表示
        newTweetText.becomeFirstResponder()
        
    }
}
////教材移植させようとしてる
//class TwitterDetailViewController: UIViewController {
//    var userName: String = ""
//    var recordDate: Date = Date()
//    var tweetText: String = ""
//
//    func configure(memo: TweetDataModel) {
//        userName = memo.userName
//        recordDate = memo.recordDate
//        tweetText = memo.tweetText
//
//        print("\(userName)\(recordDate)\(tweetText)")
//    }
//}
