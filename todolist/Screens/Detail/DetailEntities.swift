//
//  DetailEntities.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import Foundation

struct DetailEntryEntity {
    let object: TaskList
}

final class DetailEntities {
    var entryEntity: DetailEntryEntity
    
    init(entryEntity: DetailEntryEntity) {
        self.entryEntity = entryEntity
    }
}
