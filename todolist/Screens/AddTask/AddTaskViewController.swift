//
//  AddTaskViewController.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

protocol AddTaskViewInputs: AnyObject {
    func getParentController() -> AddTaskViewController
}

protocol AddTaskViewOutputs: AnyObject {
    func viewDidLoad()
}

final class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var tfTask: UITextField!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    internal var presenter: AddTaskViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension AddTaskViewController: AddTaskViewInputs{
    func getParentController() -> AddTaskViewController {
        return self
    }
}

extension AddTaskViewController : BaseView {}
