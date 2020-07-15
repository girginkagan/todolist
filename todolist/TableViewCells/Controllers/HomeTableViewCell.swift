//
//  HomeTableViewCell.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTask: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(object: TaskList){
        lblTitle.text = object.title
        lblTask.text = object.text
    }
    
}
