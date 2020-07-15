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
    let items: [TaskList]
    
    init(items: [TaskList], interactor: HomeInteractor, router: HomeRouterOutput){
        self.items = items
        self.interactor = interactor
        self.router = router
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.updateCell(object: items[indexPath.row])
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
            self.router.presentUpdateTask(object: self.items[indexPath.row])
        }
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { action, index in
            RealmHelper.deleteObject(data: self.items[indexPath.row])
            self.interactor.setTableView(router: self.router)
        }
        
        return [delete, update]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.presentDetail(object: items[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
