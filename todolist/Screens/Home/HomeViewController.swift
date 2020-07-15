//
//  HomeViewController.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

protocol HomeViewInputs: AnyObject {
    func getParentController() -> HomeViewController
}

protocol HomeViewOutputs: AnyObject {
    func viewDidLoad()
}

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewNoResult: UIView!
    
    internal var presenter: HomeViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeViewController: HomeViewInputs{
    func getParentController() -> HomeViewController {
        return self
    }
}

extension HomeViewController : BaseView {}
