//
//  RealmHelper.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import RealmSwift

class RealmHelper {
    static func saveObject<T:Object>(object: T) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(object)
        }
    }
    
    static func getObjects<T:Object>()->[T] {
        let realm = try! Realm()
        let realmResults = realm.objects(T.self)
        return Array(realmResults)
    }
    
    static func getObjects<T:Object>(filter:String)->[T] {
        let realm = try! Realm()
        let realmResults = realm.objects(T.self).filter(filter)
        return Array(realmResults)
    }
    
    static func deleteObject(data: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(data)
        }
    }
    
    static func updateObject(data: TaskList){
        let realm = try! Realm()
        let tasks = realm.objects(TaskList.self).filter("id = %@", data.id ?? "")

        if let task = tasks.first {
            try! realm.write {
                task.title = data.title
                task.text = data.text
            }
        }
    }
}
