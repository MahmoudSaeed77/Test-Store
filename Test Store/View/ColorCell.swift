//
//  ColorCell.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    @IBOutlet weak var colorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.colorLabel.textColor = UIColor.lightGray
        
    }
    func configColorCell(data: Color?) {
        colorLabel.text = data?.name ?? ""
    }
}
