//
//  HomeRouter.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

class HomeRouterInput: NSObject, UINavigationControllerDelegate {
    private func view(entryEntity: HomeEntryEntity) -> HomeViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let entities = HomeEntities(entryEntity: entryEntity)
        let dependencies = HomePresenterDependencies(interactor: interactor, router: HomeRouterOutput(view))
        let presenter = HomePresenter(entities: entities, view: view, dependencies: dependencies)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: BaseView, entryEntity: HomeEntryEntity) {
        let navBar = UINavigationController(rootViewController: view(entryEntity: entryEntity))
        navBar.delegate = self
        navBar.navigationBar.sizeToFit()
        navBar.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navBar.navigationBar.shadowImage = UIImage()
        navBar.navigationBar.isTranslucent = true
        navBar.view.backgroundColor = .clear
        navBar.navigationBar.backIndicatorImage = UIImage(named: "ic_back_arrow")
        navBar.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_back_arrow")
        navBar.navigationBar.tintColor = UIColor(named: "color_accent")
        navBar.navigationBar.topItem?.title = " "
        from.present(navBar, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationController.navigationBar.topItem?.title = " "
    }
}

class HomeRouterOutput: BaseRouter {
    private(set) weak var view: BaseView!

    init(_ view: BaseView) {
        self.view = view
    }
    
    func presentDetail(object: TaskList){
        DetailRouterInput().present(from: view, entryEntity: DetailEntryEntity(object: object))
    }
    
    func presentAddTask(){
        AddTaskRouterInput().present(from: view, entryEntity: AddTaskEntryEntity())
    }
    
    func presentUpdateTask(object: TaskList){
        UpdateTaskRouterInput().present(from: view, entryEntity: UpdateTaskEntryEntity(object: object))
    }
}
