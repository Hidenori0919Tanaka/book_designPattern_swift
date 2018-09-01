//
//  TaskDataSource .swift
//  book_designPattern_todo
//
//  Created by 田中 秀典 on 2018/08/29.
//  Copyright © 2018年 田中 秀典. All rights reserved.
//

import Foundation

final class TaskDataSource: NSObject {
    
    private var tasks = [Task]()
    
    func loadData() {
        let userDefaults = UserDefaults.standard
        let taskDictionaries = userDefaults.object(forKey: "tasks") as? [[String: Any]]
        guard let t = taskDictionaries else { return }
        for dic in t {
            let task = Task(from: dic)
            tasks.append(task)
        }
    }
    
    func save(task: Task) {
        tasks.append(task)
        
        var taskDictionaries = [[String: Any]]()
        for t in tasks {
            let taskDictionary: [String: Any] = ["text": t.text,
                                                 "deadline": t.deadline]
            taskDictionaries.append(taskDictionary)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(taskDictionaries, forKey: "tasks")
        userDefaults.synchronize()
    }
    
    func count() ->Int {
        return tasks.count
    }
    
    func data(at index: Int) ->Task? {
        if (tasks.count > index) {
            return tasks[index]
        }
        return nil
    }
}
