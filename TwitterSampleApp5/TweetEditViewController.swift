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
        view.endEditing(true)
        newTweetText.text = displayText
    }
}
