//
//  AddTaskPresenter.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

typealias AddTaskPresenterDependencies = (
    interactor: AddTaskInteractor,
    router: AddTaskRouterOutput
)

class AddTaskPresenter: BasePresenter {
    
    var entities: AddTaskEntities
    private weak var view: AddTaskViewInputs!
    let dependencies: AddTaskPresenterDependencies
    
    init(entities: AddTaskEntities, view: AddTaskViewInputs, dependencies: AddTaskPresenterDependencies) {
        self.view = view
        self.entities = entities
        self.dependencies = dependencies
    }
}

extension AddTaskPresenter: AddTaskViewOutputs {
    
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        entities.viewTitle.frame = CGRect(x: 0, y: 0, width: view.getParentController().view.frame.width, height: view.getParentController().navigationController?.navigationBar.frame.height ?? 0)
        entities.viewTitle.setTitleUI(type: NavigationTitleTypes.TitleAddNote)
        
        view.getParentController().navigationItem.titleView = entities.viewTitle
    }
}

extension AddTaskPresenter: AddTaskInteractorOutputs{
}
