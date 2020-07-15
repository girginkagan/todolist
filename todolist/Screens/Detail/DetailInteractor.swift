//
//  DetailInteractor.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import Foundation

protocol DetailInteractorOutputs: AnyObject {
}

final class DetailInteractor: InteractorHelper, BaseInteractor {
    weak var presenter: DetailInteractorOutputs?
    weak var entities: DetailEntities?
    
}
