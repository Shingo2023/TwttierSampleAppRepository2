//
//  TweetEditViewController.swift
//  TwitterSampleApp5
//
//  Created by 高橋真悟 on 2024/01/08.
//

import Foundation
import UIKit
import RealmSwift
//サブクラス画面遷移後の内容をまとめて書く
class TweetEditViewController: UIViewController {
    @IBOutlet weak var newTweetTextUITextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarButton()//ナビゲーションバーに投稿ボタンを配置
        newTweetText() //テキスト　書き込むテキストと　ユーザー名、時間などを付属 また、それをRealmを使ってHomeViewに保存
        
    }
    //オブジェクトCのボタン機能を追加
    @objc func tapAddButton() {
        
        saveData()//セーブデータを入れて
        //この1行に変更で戻れる モーダル遷移を戻る
        self.dismiss(animated: true)
    }
    
    @objc func tapCancelButton() {
        self.dismiss(animated: true)
    }
    
    //ナビゲーションバーボタン
    @objc func setNavigationBarButton() {
        //セレクター　//@objcのメソッドを使う合図　()アクションが呼び出される対象のメソッドを指定
        let buttonActionSelector: Selector = #selector(tapAddButton)
        let cancelButtonSelector: Selector = #selector(tapCancelButton)
        //UIBarButtonItemの内容を定義
        let rightBarButton = UIBarButtonItem(title: "投稿", style: .plain, target: self, action: buttonActionSelector)
        let cancelButton = UIBarButtonItem(title: "キャンセル", style: .plain, target: self, action: cancelButtonSelector)
        //UIBarButtonItemはナビゲーションバーとライトバーボタンで定義
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    //ツールバー上のキーボードと閉じるボタン
    func setDoneBuuton () {
        //ツールバー（キーボードを乗せるツールメニュー）の作成と設定
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        //フレキシブル　柔軟
        //ツールバー内のアイテムの間に柔軟なスペースを作成するための UIBarButtonItem です。このスペースは、後で commitButton（Doneボタン）をツールバーの端に寄せるために使用されます。
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //commitButton は、UIBarButtonItem のインスタンスで、システム提供の "Done" スタイルのボタンです。このボタンが押されたときに実行されるメソッドは commitButtonTapped です。このメソッドは #selector を使用して指定されています。
        let commitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(commitButtonTapped))
        //最後に、作成した flexibleSpace と commitButton をツールバーの items プロパティに設定しています。これにより、ツールバーに柔軟なスペースとDoneボタンが配置されます。
        toolBar.items = [flexibleSpace, commitButton]
        
        // inputAccessoryView プロパティを使用して、キーボードの代わりに表示されるビューを指定しています。
        //このツールバーには、柔軟なスペースと "Done" ボタンが含まれており、ユーザーがテキスト編集を行った後に "Done" ボタンをタップできるようになります。
        newTweetTextUITextView.inputAccessoryView = toolBar
    }
    //"Done"ボタンがタップされると、このメソッドが呼ばれ、newTweetTextUITextView上のキーボードが閉じられるようになります。これによって、ユーザーがテキスト編集を終了し、キーボードを非表示にできるようになります。
    @objc func commitButtonTapped() {
        //テキスト入力フィールドやテキストビューなどのファーストレスポンダ（フォーカスを持つオブジェクト）が現在キーボードとして表示されている場合、そのキーボードを非表示にするメソッドです。
        newTweetTextUITextView.resignFirstResponder()
    }
    
    func newTweetText() {
        let newtweetDataModel = TweetDataModel()
        newtweetDataModel.userName = "ユーザー名"
        newtweetDataModel.recordDate = Date()
        newtweetDataModel.tweetText = "これは新しいツイート文です。"
        
        let displayText: String = """
     \(newtweetDataModel.userName)\(newtweetDataModel.recordDate)\(newtweetDataModel.tweetText)
    """
        
        newTweetTextUITextView.text = displayText
    }
    
    //毎回実行されるライフサイクル
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ビューが表示されたときにキーボードを表示
        newTweetTextUITextView.becomeFirstResponder()
        
    }
    //    //データを保存するメソッド
    //    //()内は引数リスト　withが外部引数名　text:が内部引数名　Stringが型名
    //    //外部引数名とは、関数呼び出し時に使う引数のラベルです。内部引数名は関数内で引数を指すために使用されます。
    func saveData() {
        //モデルを定数tweetDataとして定義
        let tweetData = TweetDataModel()
        let newtweetDataModel = TweetDataModel()
        newtweetDataModel.userName = "ユーザー名"
        newtweetDataModel.recordDate = Date()
        newtweetDataModel.tweetText = newTweetTextUITextView.text
                
        //データを保存する際にはこのようにRealmクラスをインスタンス化している try!を用いる
        //try!は、エラーが発生した場合にプログラムをクラッシュさせることを意味します。 通常は、エラー処理が適切に行われるべきですが、この場合は単純な例外処理として使用されています。
        let realm = try! Realm()
        //writeライト　書く、書き込むという意味
        try! realm.write {
            realm.add(newtweetDataModel)//モデルを追加
        }
    }
}
