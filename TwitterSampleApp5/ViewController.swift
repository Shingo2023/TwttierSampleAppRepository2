//
//  ViewController.swift
//  TwitterSampleApp5
//
//  Created by 高橋真悟 on 2024/01/05.
//

//モジュールをインポート　この先下記でかくコードはこのモジュールに格納されている機能しか扱えない
import UIKit
import Foundation

//iOSアプリケーションでは画面の制御に使用されるコントローラークラス
//ViewControllerクラスが後続のそれらを継承している
//UIViewControllerはクラス　iOSアプリケーションの画面管理に関連する基本的な機能を提供するクラス
//UITableViewDelegateはプロトコル　UITableView（テーブルビュー）のイベントや振る舞いに関連するメソッドを提供する
//UITableViewDataSourceプロトコル　UITableViewに表示するデータの提供や管理に関連するメソッドを提供する
//UIViewControllerプロトコル iOSアプリケーションの画面管理に関連する基本的な機能を提供する
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //@IBOutlet: Interface Builderとの接続を示すキーワードで、この宣言によってコードとInterface Builder（StoryboardまたはXIBファイル）で作成したUI要素を関連付けることができる
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newTweetButton: UIButton!
    @IBAction func newTweetButton(_ sender: UIButton) {
        transitiontoTweetEditView()
    }
    
    var twitterDataList: [TweetDataModel] = []
    
    //継承　ライフサイクルメソッドの２つ目の工程　画面の読み込みが終わった時の処理がここでされる
    //ボタンを角丸にしたり、画面の背景だったりを処理する
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TwitterHomeViewTableCell", bundle: nil),forCellReuseIdentifier: "twitterHomeViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        //エラー　'ViewController' 型の値を '(任意の UITableViewDelegate)?' 型に割り当てることはできません。
        
        tableView.tableFooterView = UIView()
        setTwitterData()//34行目のインスタンス化
    }
    
    
    func setTwitterData() {
        let tweetDataModel = TweetDataModel(userName: "ユーザー名",recordDate: Date(), tweetText: "これは(i)番目のツイートです。このツイートは文章が続くと下に伸びて表示されます。")
        
        twitterDataList.append(tweetDataModel)
        
        configureNewTweetButton()
    }
    func configureNewTweetButton() { //configure 構成
        newTweetButton.layer.cornerRadius = newTweetButton.bounds.width / 2
    }
    func transitiontoTweetEditView() { //transitionto 移行
        let storyboard = UIStoryboard(name: "TweetEditViewController", bundle: nil)
        let tweetEditViewController = storyboard.instantiateViewController(identifier: "tweetEditViewController")
        present(tweetEditViewController, animated: true) //presentメソッドでモーダル遷移している　デリゲートが機能したら使えるかも
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//セル数を決めるメソッド
            return twitterDataList.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//セルを定義しているメソッド
        let cell = tableView.dequeueReusableCell(withIdentifier:"twitterHomeViewTableCell", for: indexPath) as! TwitterHomeViewTableCell
        let twitterDataModel: TweetDataModel = twitterDataList[indexPath.row]
        cell.setup(userName: twitterDataModel.userName, recordDateLabel: twitterDataModel.recordDate, twitterText: twitterDataModel.tweetText)
        return cell }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)//セルがタップされた際にタップさせたインデックス番号が渡されるメソッド
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }
}

