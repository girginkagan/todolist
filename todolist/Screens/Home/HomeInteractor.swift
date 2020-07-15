//
//  HomeInteractor.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

protocol HomeInteractorOutputs: AnyObject {
    func onTableViewReady(source: HomeTableViewSource?)
}

final class HomeInteractor: InteractorHelper, BaseInteractor {
    weak var presenter: HomeInteractorOutputs?
    weak var entities: HomeEntities?
    
    func setTableView(router: HomeRouterOutput){
        entities?.results = RealmHelper.getObjects()
        entities?.tableViewSource = HomeTableViewSource(items: entities?.results ?? [], interactor: self, router: router)
        presenter?.onTableViewReady(source: entities?.tableViewSource)
    }
}
