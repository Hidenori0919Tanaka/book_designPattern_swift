//
//  Task.swift
//  book_designPattern_todo
//
//  Created by 田中 秀典 on 2018/08/29.
//  Copyright © 2018年 田中 秀典. All rights reserved.
//

import Foundation

final class Task {
    var text: String // タスクの内容
    var deadline: Date // 締切
    
    // textとdeadlineを引数にとるイニシャライザメソッド
    init (text: String, deadline: Date) {
        self.text = text
        self.deadline = deadline
    }
    
    // dictionaryを引数にとるイニシャライザメソッド。
    init(from dictionary: [String: Any]) {
        text = dictionary["text"] as! String
        deadline = dictionary["deadline"] as! Date
    }
}


