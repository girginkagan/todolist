//
//  HomeEntities.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import Foundation
import RealmSwift

struct HomeEntryEntity {
}

final class HomeEntities {
    var entryEntity: HomeEntryEntity
    let viewTitle = CustomNavigationTitleView.instanceFromNib()
    var tableViewSource: HomeTableViewSource?
    var results: [TaskList] = []
    
    init(entryEntity: HomeEntryEntity) {
        self.entryEntity = entryEntity
    }
}
