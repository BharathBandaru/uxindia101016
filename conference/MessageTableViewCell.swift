//
//  MessageTableViewCell.swift
//  conference
//
//  Created by Bharath Bandaru on 11/10/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.clipsToBounds=true
        nameLabel.layer.cornerRadius=nameLabel.frame.size.height/2
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
