//
//  UpdateTaskPresenter.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit
import SPAlert

typealias UpdateTaskPresenterDependencies = (
    interactor: UpdateTaskInteractor,
    router: UpdateTaskRouterOutput
)

class UpdateTaskPresenter: BasePresenter {
    
    var entities: UpdateTaskEntities
    private weak var view: UpdateTaskViewInputs!
    let dependencies: UpdateTaskPresenterDependencies
    
    init(entities: UpdateTaskEntities, view: UpdateTaskViewInputs, dependencies: UpdateTaskPresenterDependencies) {
        self.view = view
        self.entities = entities
        self.dependencies = dependencies
    }
}

extension UpdateTaskPresenter: UpdateTaskViewOutputs {
    
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        entities.viewTitle.frame = CGRect(x: 0, y: 0, width: view.getParentController().view.frame.width, height: view.getParentController().navigationController?.navigationBar.frame.height ?? 0)
        entities.viewTitle.setTitleUI(type: NavigationTitleTypes.TitleUpdateNote)
        
        view.getParentController().navigationItem.titleView = entities.viewTitle
        
        let tapGestureHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGestureHideKeyboard.cancelsTouchesInView = false
        view.getParentController().view.addGestureRecognizer(tapGestureHideKeyboard)
        
        dependencies.interactor.initData()
        
        view.getParentController().tfTitle.text = entities.entryEntity.object.title
        view.getParentController().tfTask.text = entities.entryEntity.object.text
        
        view.getParentController().tfTitle.tag = 0
        view.getParentController().tfTask.tag = 1
        
        dependencies.interactor.observeTextField(textField: view.getParentController().tfTask)
        dependencies.interactor.observeTextField(textField: view.getParentController().tfTitle)
        
        view.getParentController().btnUpdate.addTarget(self, action: #selector(btnUpdateTapped), for: .touchUpInside)
    }
    
    @objc func hideKeyboard(_ sender: UITapGestureRecognizer){
        view.getParentController().view.endEditing(true)
    }
    
    @objc func btnUpdateTapped(_ sender: UIButton){
        dependencies.interactor.updateData()
        SPAlert.present(title: "Success", preset: .done)
        dependencies.router.pop(animated: true)
    }
}

extension UpdateTaskPresenter: UpdateTaskInteractorOutputs{
    func onDataReady(ready: Bool) {
        if ready{
            view.getParentController().btnUpdate.backgroundColor = entities.colorEnabled
            view.getParentController().btnUpdate.isEnabled = true
        }
        else{
            view.getParentController().btnUpdate.backgroundColor = entities.colorDisabled
            view.getParentController().btnUpdate.isEnabled = false
        }
    }
    
}
