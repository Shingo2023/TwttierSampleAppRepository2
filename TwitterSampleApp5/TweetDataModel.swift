//
//  TweetDataModel.swift
//  TwitterSampleApp5
//
//  Created by 高橋真悟 on 2024/01/07.
//

import Foundation
import RealmSwift

class TweetDataModel: Object {
    
    @objc dynamic var id: String = UUID().uuidString//データを一意に識別するための識別子
    @objc dynamic var userName: String = ""
    @objc dynamic var recordDate: Date = Date()
    @objc dynamic var tweetText: String = ""
}

//import Foundation
//
//struct TweetDataModel {
//
//    var userName: String
//    var recordDate: Date
//    var tweetText: String
//}
