//
//  AddTaskInteractor.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import Foundation

protocol AddTaskInteractorOutputs: AnyObject {
}

final class AddTaskInteractor: InteractorHelper, BaseInteractor {
    weak var presenter: AddTaskInteractorOutputs?
    weak var entities: AddTaskEntities?
    
}
