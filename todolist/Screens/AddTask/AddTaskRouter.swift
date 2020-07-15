//
//  AddTaskRouter.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

class AddTaskRouterInput: NSObject {
    private func view(entryEntity: AddTaskEntryEntity) -> AddTaskViewController {
        let view = AddTaskViewController()
        let interactor = AddTaskInteractor()
        let entities = AddTaskEntities(entryEntity: entryEntity)
        let dependencies = AddTaskPresenterDependencies(interactor: interactor, router: AddTaskRouterOutput(view))
        let presenter = AddTaskPresenter(entities: entities, view: view, dependencies: dependencies)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: BaseView, entryEntity: AddTaskEntryEntity) {
        from.push(view(entryEntity: entryEntity), animated: true)
    }
}

class AddTaskRouterOutput: BaseRouter {
    private(set) weak var view: BaseView!

    init(_ view: BaseView) {
        self.view = view
    }
}
