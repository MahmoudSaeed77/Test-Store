//
//  BannerCell.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit
import Kingfisher

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    func configCell(data: Banner?) {
        bannerImgView.kf.setImage(with: URL(string: data?.image ?? ""))
    }
    
    func configCellDetails(data: imagees?) {
        bannerImgView.kf.setImage(with: URL(string: data?.image ?? ""))
    }
}
