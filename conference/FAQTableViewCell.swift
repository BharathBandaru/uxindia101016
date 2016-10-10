//
//  FAQTableViewCell.swift
//  conference
//
//  Created by Laxmi Rekha on 08/09/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    
    @IBOutlet weak var h1: UILabel!
    @IBOutlet weak var colorbar: UIView!
    @IBOutlet weak var h2: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
     /*   let fixedWidth = h2.frame.size.width
        h2.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = h2.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = h2.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        h2.frame = newFrame;*/
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
