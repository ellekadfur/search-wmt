//
//  CountryListTableViewCell.swift
//  demoList
//
//  Created by Elle Kadfur on 02/28/25.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCountryCode: UILabel!
    @IBOutlet weak var labelCountryCapital: UILabel!
    @IBOutlet weak var labelCountryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
