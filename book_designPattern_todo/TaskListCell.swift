//
//  TaskListCell.swift
//  book_designPattern_todo
//
//  Created by 田中 秀典 on 2018/09/01.
//  Copyright © 2018年 田中 秀典. All rights reserved.
//

import Foundation
import UIKit

final class TaskListCell: UITableViewCell {
    
    private var taskLabel: UILabel!
    private var deadlineLabel: UILabel!
    
    var task: Task? {
        didSet {
            guard let t = task else { return }
            taskLabel.text = t.text
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm"
            
            deadlineLabel.text = formatter.string(from: t.deadline)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        taskLabel = UILabel()
        taskLabel.textColor = UIColor.black
        taskLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(taskLabel)
        
        deadlineLabel = UILabel()
        deadlineLabel.textColor = UIColor.black
        deadlineLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(deadlineLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        taskLabel.frame = CGRect(x: contentView.bounds.origin.x + 15.0,
                                 y: contentView.bounds.origin.y + 15.0,
                                 width: contentView.frame.width - (15.0 * 2),
                                 height: 15)
        
        deadlineLabel.frame = CGRect(x: taskLabel.frame.origin.x,
                                     y: taskLabel.frame.maxY + 8.0,
                                     width: taskLabel.frame.width,
                                     height: 15.0)
    }
}
