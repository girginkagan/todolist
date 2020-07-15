//
//  AddTaskInteractor.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import Foundation
import RxSwift
import RxCocoa

protocol AddTaskInteractorOutputs: AnyObject {
    func onDataReady(ready: Bool)
}

final class AddTaskInteractor: InteractorHelper, BaseInteractor {
    weak var presenter: AddTaskInteractorOutputs?
    weak var entities: AddTaskEntities?
    
    func initData(){
        entities?.objectTask.id = String(Int(Date().timeIntervalSince1970))
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
    
    func addData(){
        RealmHelper.saveObject(object: entities?.objectTask ?? TaskList())
    }
}
