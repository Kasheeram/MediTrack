//
//  MedicineDetailsTableViewCell.swift
//  MediTrack
//
//  Created by Apogee on 7/6/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit

class MedicineDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var medicineName: UILabel!
    @IBOutlet weak var doseAmount: UILabel!
    @IBOutlet weak var numberofTimes: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
