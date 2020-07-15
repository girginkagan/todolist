//
//  AddTaskPresenter.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit
import SPAlert

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
        
        let tapGestureHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGestureHideKeyboard.cancelsTouchesInView = false
        view.getParentController().view.addGestureRecognizer(tapGestureHideKeyboard)
        
        dependencies.interactor.initData()
        
        view.getParentController().tfTitle.tag = 0
        view.getParentController().tfTask.tag = 1
        
        dependencies.interactor.observeTextField(textField: view.getParentController().tfTask)
        dependencies.interactor.observeTextField(textField: view.getParentController().tfTitle)
        
        view.getParentController().btnAdd.addTarget(self, action: #selector(btnAddTapped), for: .touchUpInside)
    }
    
    @objc func hideKeyboard(_ sender: UITapGestureRecognizer){
        view.getParentController().view.endEditing(true)
    }
    
    @objc func btnAddTapped(_ sender: UIButton){
        dependencies.interactor.addData()
        SPAlert.present(title: "Success", preset: .done)
        dependencies.router.pop(animated: true)
    }
}

extension AddTaskPresenter: AddTaskInteractorOutputs{
    func onDataReady(ready: Bool) {
        if ready{
            view.getParentController().btnAdd.backgroundColor = entities.colorEnabled
            view.getParentController().btnAdd.isEnabled = true
        }
        else{
            view.getParentController().btnAdd.backgroundColor = entities.colorDisabled
            view.getParentController().btnAdd.isEnabled = false
        }
    }
    
}
