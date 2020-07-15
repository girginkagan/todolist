//
//  DetailViewController.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

protocol DetailViewInputs: AnyObject {
    func getParentController() -> DetailViewController
}

protocol DetailViewOutputs: AnyObject {
    func viewDidLoad()
}

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var btnClose: UIButton!
    
    internal var presenter: DetailViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailViewController: DetailViewInputs{
    func getParentController() -> DetailViewController {
        return self
    }
}

extension DetailViewController : BaseView {}
