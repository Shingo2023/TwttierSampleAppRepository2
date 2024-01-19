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
    //mainStoryboardのTableViewとIBoutlet接続
    @IBOutlet weak var tableView: UITableView!
    //mainStoryboardのTableViewにあるボタンとIBoutlet接続
    @IBOutlet weak var newTweetButton: UIButton!
    //mainStoryboardのTableViewにあるボタンとIBAction接続
    //(_ sender: UIButton)ボタンが押された際に呼び出されるメソッド
    @IBAction func newTweetButton(_ sender: UIButton) {
        transitiontoTweetEditView()//ransitiontoTweetEditView(): ツイートの編集画面に遷移するためのメソッド
    }
    //twitterDataListを変数twitterDataListとして使えるようにしている
    var tweetDataList: [TweetDataModel] = []
    
    //継承　ライフサイクルメソッドの２つ目の工程　画面の読み込みが終わった時の処理がここでされる
    //ボタンを角丸にしたり、画面の背景だったりを処理する
    override func viewDidLoad() {
        //親クラスのビューコントローラが持つ初期化や画面のセットアップが実行され、その後にサブクラスのviewDidLoadメソッドが続けて実行される
        super.viewDidLoad()
        //テーブルビューに対してカスタムセルを登録しています。UINibクラスを使用して、"TwitterHomeViewTableCell"というnib（Interface Builder（storyboardなど）で作成されたビューの設計図）を指定しています。これにより、テーブルビューが必要なときにこのnibを使用してセルを再利用できるようになります
        tableView.register(UINib(nibName: "TwitterHomeViewTableCell", bundle: nil),forCellReuseIdentifier: "twitterHomeViewTableCell")
        //ViewControllerクラスがUITableViewDataSourceプロトコルを採用していることを示しています。データソースプロトコルは、テーブルビューにデータを提供するためのメソッドを実装する必要があります。 selfはこのViewControllerクラス自体を指します。おそらくデータソースプロトコルがあるとこれを書かないといけない。
        tableView.dataSource = self
        //デリゲートプロトコルは、テーブルビューのイベントや動作に関するメソッドを実装するもの　おそらくデリゲートプロトコルがあるとこれを書かないといけない
        tableView.delegate = self
        //この行では、テーブルビューの最後に表示される余白（フッター）を空のUIViewに設定しています。これにより、テーブルビューの最後に余白ができるのを防ぐ
        tableView.tableFooterView = UIView()
        //インスタンス化
        setTwitterData()
    }
    //ツイートするテキスト直接書き込んでそのまま出力するメソッド
    func setTwitterData() {
        //データモデルに沿った形式でないといけない
        let tweetDataModel = TweetDataModel(userName: "ユーザー名",recordDate: Date(), tweetText: "これは(i)番目のツイートです。このツイートは文章が続くと下に伸びて表示されます。")
        //このようにリストにデータを追加することで、後でそのリストを参照してツイートデータを取得したり、表示に利用することができる
        tweetDataList.append(tweetDataModel)
        //インスタンス化
        configureNewTweetButton()
    }
    //configure 構成 つまりボタンの構成のメソッド
    func configureNewTweetButton() {
        //newTweetButton.layer.cornerRadius cornerRadiusプロパティを設定しています。このプロパティは、レイヤーの角の半径を指定します。
        //newTweetButton の幅を基に、ボタンの角の半径を設定しています。
        //通常、正方形のボタンの場合、ボタンの幅と高さは同じであるため、bounds.width を使用しています。この値を 2 で割ることで、半径がボタンの幅の半分になります。
        newTweetButton.layer.cornerRadius = newTweetButton.bounds.width / 2
    }
    //transitionto 移行　つまり　ツイート編集画面に遷移するメソッド
    //この関数は引数を取らないことが期待されています。
    func transitiontoTweetEditView() {
        //UIStoryboardクラスを使用して、"TweetEditViewController"という名前のストーリーボードを取得　バンドルはstoryboardなどが存在するディレクトリ構造のこと　nilはデフォルト
        let storyboard = UIStoryboard(name: "TweetEditViewController", bundle: nil)
        //storyboardから"tweetEditViewController"という識別子を持つViewControllerをインスタンス化（instantiateViewController：インスタントシエート）します。 これにより、指定されたViewControllerが生成されます。
        let tweetEditViewController = storyboard.instantiateViewController(identifier: "tweetEditViewController")
        //presentメソッドでモーダル遷移している animated: true アニメーション有効
        present(tweetEditViewController, animated: true)
    }
    //func tableView　UITableViewのデータソースを提供するために必要なメソッド
    //引数として、tableViewは対象のUITableViewインスタンスを、sectionはセクションの番号を指定します。戻り値のIntは、指定されたセクションに含まれる行の数を示します。
    //numberOfRowsInSection セルの数を決めるメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                //tweetDataList配列で、配列の要素数（行の数）を返しています。テーブルビューに表示する行は、この関数が返す値によって制御されます。行の数がゼロまたは負の場合、セクションには何も表示されない
                return tweetDataList.count
        }
    //このメソッドは、UITableViewDelegateプロトコルの一部として実装されるメソッドであり、UITableViewの各行に対応するセルを提供するためのもの。  指定されたインデックスパス（indexPath）に対応するセルを作成して返している
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルの再利用を試み、再利用可能なセルが存在する場合はそれを取得し、存在しない場合は新しく作成します。withIdentifierで指定された識別子に基づいてセルを取得または作成します。取得したセルはTwitterHomeViewTableCell型としてアサーションされます。
        let cell = tableView.dequeueReusableCell(withIdentifier:"twitterHomeViewTableCell", for: indexPath) as! TwitterHomeViewTableCell
        //データソースから、指定された行に対応するデータを取得します。この場合、tweetDataListはツイートデータモデルを格納する配列であり、indexPath.rowは行の位置を示します。
        let tweetDataModel: TweetDataModel = tweetDataList[indexPath.row]
        //カスタムセルである TwitterHomeViewTableCell の setup メソッドを呼び出して、セルに表示するデータを設定します。ユーザー名、記録日、ツイートのテキストなどを設定
        cell.setup(userName: tweetDataModel.userName, recordDateLabel: tweetDataModel.recordDate, tweetText: tweetDataModel.tweetText)
            //最後に、セットアップが完了したセルを返します。これにより、テーブルビューがセルを表示できる
        return cell }
    //このメソッドは、UITableViewDelegate プロトコルの一部として実装されるメソッドであり、ユーザーがUITableViewの行を選択したときに呼び出されます。具体的には、タップされた行の位置を示す indexPath が引数として渡されます。
    // didSelectRowAt ユーザーがテーブルビューの行を選択したときに呼び出されます。引数として、tableViewは対象の UITableView インスタンスを、indexPathは行とセクションの位置を指定します。
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //クラスを使用して、"Main" という名前のストーリーボードを取得
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }
}

