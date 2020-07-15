//
//  AddTaskEntities.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import Foundation

struct AddTaskEntryEntity {
}

final class AddTaskEntities {
    var entryEntity: AddTaskEntryEntity
    let viewTitle = CustomNavigationTitleView.instanceFromNib()
    
    init(entryEntity: AddTaskEntryEntity) {
        self.entryEntity = entryEntity
    }
}
