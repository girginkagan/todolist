//
//  UpdateTaskInteractor.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit
import RxSwift
import RxCocoa

protocol UpdateTaskInteractorOutputs: AnyObject {
    func onDataReady(ready: Bool)
}

final class UpdateTaskInteractor: InteractorHelper, BaseInteractor {
    weak var presenter: UpdateTaskInteractorOutputs?
    weak var entities: UpdateTaskEntities?
    
    func initData(){
        entities?.objectTask.id = entities?.entryEntity.object.id
        entities?.objectTask.title = entities?.entryEntity.object.title
        entities?.objectTask.text = entities?.entryEntity.object.text
    }
    
    func observeTextField(textField: UITextField){
        textField.rx.controlEvent(.editingChanged).subscribe(onNext: { [weak self] _ in
            if let text = textField.text {
                if textField.tag == 0{
                    if text.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == ""{
                        self?.entities?.objectTask.title = nil
                    }
                    else{
                        self?.entities?.objectTask.title = text
                    }
                }
                else if textField.tag == 1{
                    if text.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == ""{
                        self?.entities?.objectTask.text = nil
                    }
                    else{
                        self?.entities?.objectTask.text = text
                    }
                }
                
                self?.checkData()
            }
        }).disposed(by: entities?.disposeBag ?? DisposeBag())
    }
    
    func checkData(){
        presenter?.onDataReady(ready: entities?.objectTask.title != nil && entities?.objectTask.text != nil)
    }
    
    func updateData(){
        RealmHelper.updateObject(data: entities?.objectTask ?? TaskList())
    }
}
