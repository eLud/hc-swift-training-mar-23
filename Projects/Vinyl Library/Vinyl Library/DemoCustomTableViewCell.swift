//
//  DemoCustomTableViewCell.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 08/03/2023.
//

import UIKit

class DemoCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        
    }
}
