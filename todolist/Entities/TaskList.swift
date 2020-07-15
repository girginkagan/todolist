//
//  TaskList.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import RealmSwift

final class TaskList: Object {
    @objc dynamic var id: String?
    @objc dynamic var text: String?
    @objc dynamic var title: String?

    override static func primaryKey() -> String? {
        return "id"
    }
}
