//
//  MyTableViewCell.swift
//  NewsPortal
//
//  Created by user231854 on 3/25/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
        }

}
