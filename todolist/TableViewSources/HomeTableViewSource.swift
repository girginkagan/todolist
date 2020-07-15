//
//  HomeTableViewSource.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

final class HomeTableViewSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    let interactor: HomeInteractor
    let router: HomeRouterOutput
    
    init(interactor: HomeInteractor, router: HomeRouterOutput){
        self.interactor = interactor
        self.router = router
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let update = UITableViewRowAction(style: .normal, title: "Update") { action, index in
            print("update")
        }
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { action, index in
            print("Delete")
        }
        
        return [delete, update]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.presentDetail()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
