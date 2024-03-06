//
//  TwitterHomeViewTableCell.swift
//  TwitterSampleApp5
//
//  Created by 高橋真悟 on 2024/01/07.
//
//iOSアプリケーションのユーザーインターフェースを構築するためのフレームワーク
import UIKit
//TwitterHomeViewTableCellというサブクラスを宣言している　テーブルビューのセルのカスタムクラス
class TwitterHomeViewTableCell: UITableViewCell {
    //TwitterHomeViewTableCell.xibファイルのユーザーネームラベルとIBOutlet接続
    //private他のクラスからのアクセスできないようにしている
    //weak var　弱参照
    @IBOutlet private weak var userName: UILabel!
    //TwitterHomeViewTableCell.xibファイルの日付ラベルとIBOutlet接続
    @IBOutlet private weak var recordDateLabel: UILabel!
    //TwitterHomeViewTableCell.xibファイルのstackView（ツイートテキスト）とIBOutlet接続
    @IBOutlet weak var tweetText: UILabel!
    //xibが呼び出された時に使われるメソッド　awakeFromNib()メソッドを呼び出すだけで、特に追加の処理は行われていません
    override func awakeFromNib() {
        //親クラスの同名のメソッドを呼び出す役割
        super.awakeFromNib()
    }
    //このコードは、UITableViewCellのサブクラスである TwitterHomeViewTableCell クラスにおいて、親クラスの setSelected(_:animated:) メソッドをオーバーライドしています。
    override func setSelected(_ selected: Bool, animated: Bool) {
        //セルが選択されたときの動作を定義します。通常、このメソッド内でセルの外観や状態を変更する処理が行われます。オーバーライドしたコードでは、まず super.setSelected(selected, animated: animated) を呼び出して、親クラスの同名メソッドを実行しています。
        //この行の下に追加のコードがないため、特定のカスタム処理は行われません。したがって、このコードの存在自体は、デフォルトの動作を保持するためのもの
        super.setSelected(selected, animated: animated)
    }
    //TwitterHomeViewTableCell クラス内に定義された setup メソッド
    //各UIの設定を行う目的
    func setup(userName: String, recordDateLabel: Date, tweetText: String)  {
        //パラメータで受け取った文字列を、セル内の userName という UILabel の text プロパティにセットしています。これにより、セルのユーザー名表示部分に外部から渡されたユーザー名が表示されます。
        self.userName.text = userName
        //DateFormatter クラスのインスタンス 日付を特定のフォーマットで表示する
        var dateFormatter = DateFormatter()
        //日付フォーマットを "yyyy/MM/dd" に設定します。これにより、日付は年/月/日の形式で表示される
        dateFormatter.dateFormat = "yyyy/MM/dd"
        //渡された recordDateLabel パラメータ（Date型）を指定されたフォーマットに従って文字列に変換します。
        let formattedDate = dateFormatter.string(from: recordDateLabel)
        //変換された日付文字列を、セル内の recordDateLabel という UILabel の text プロパティにセットします。これにより、セルの日付表示部分に外部から渡された日付が表示されます。
        self.recordDateLabel.text = formattedDate
        //パラメータで受け取った文字列を、セル内の tweetText という UILabel の text プロパティにセットします。これにより、セルのツイートテキスト表示部分に外部から渡されたツイートテキストが表示されます。
        self.tweetText.text = tweetText
    }
    
}

