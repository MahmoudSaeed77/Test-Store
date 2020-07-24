//
//  CatgoriesCell.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit

class CatgoriesCell: UICollectionViewCell {
    @IBOutlet weak var catName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    func configCell(data: Category?) {
        catName.text = data?.name ?? ""
    }
}
