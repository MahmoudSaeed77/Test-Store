//
//  HomeDealCell.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit
import Kingfisher

class HomeDealCell: UICollectionViewCell {

    @IBOutlet weak var dealImgView: UIImageView!
    @IBOutlet weak var dealName: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self.originalPrice.text!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        self.originalPrice.attributedText = attributeString
    }

    func configData(data: Offer?) {
        dealImgView.kf.setImage(with: URL(string: data?.image ?? ""))
        dealName.text = data?.name ?? ""
        originalPrice.text = (data?.price ?? "")+" جنيه"
        finalPrice.text = (data?.discountPrice ?? "")+" جنيه"
    }
    
    func configProductData(data: Product?) {
        dealImgView.kf.setImage(with: URL(string: data?.image ?? ""))
        dealName.text = data?.name ?? ""
        originalPrice.text = (data?.discountPrice ?? "")+" جنيه"
        finalPrice.text = (data?.price ?? "")+" جنيه"
    }
    func configRelatedData(data: Related?) {
        dealImgView.kf.setImage(with: URL(string: data?.image ?? ""))
        dealName.text = data?.name ?? ""
        originalPrice.text = (data?.discountPrice ?? "")+" جنيه"
        finalPrice.text = (data?.price ?? "")+" جنيه"
    }
}
