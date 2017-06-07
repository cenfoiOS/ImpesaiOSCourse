//
//  ToDoListCustomCell.swift
//  CleanSwiftExample
//
//  Created by Cesar Brenes on 6/6/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit

class ToDoListCustomCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(task: ToDoTasksList.TaskModelCell){
        leftLabel.text = task.counter
        rightLabel.text = task.text
    }
    
}
