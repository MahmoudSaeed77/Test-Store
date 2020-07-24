//
//  DetailsViewController.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imgCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var colerCollectionView: UICollectionView!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var describtionLabel: UILabel!
    @IBOutlet weak var anotherDealsCollectionView: UICollectionView!
    @IBOutlet weak var capacityView: UIView!
    @IBOutlet weak var capacityLabel: UILabel!
    
    
    private var viewModel: DetailViewModel!
    
    var productId: Int = 0
    var detailResponseData = DetailResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = DetailViewModel(view: self)
        setupUI()
        configCollections()
    }
    
    
    fileprivate func setupUI() {
        rateView.layer.cornerRadius = 15
        
        
        favBtn.backgroundColor = UIColor.white
        favBtn.layer.cornerRadius = 30
        favBtn.layer.shadowColor = UIColor.black.cgColor
        favBtn.layer.shadowRadius = 5
        favBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
        favBtn.layer.shadowOpacity = 0.3
        
        
        capacityView.layer.borderWidth = 1
        capacityView.layer.borderColor = UIColor.darkGray.cgColor
        capacityView.layer.cornerRadius = 10
        
        
        addToCartBtn.layer.borderWidth = 1
        addToCartBtn.layer.borderColor = UIColor.lightGray.cgColor
        addToCartBtn.layer.cornerRadius = 4
    }
    
    fileprivate func configCollections() {
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self
        
        colerCollectionView.delegate = self
        colerCollectionView.dataSource = self
        
        anotherDealsCollectionView.delegate = self
        anotherDealsCollectionView.dataSource = self
        
        anotherDealsCollectionView.register(UINib(nibName: "HomeDealCell", bundle: nil), forCellWithReuseIdentifier: "HomeDealCell")
        
        self.imgCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.colerCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.anotherDealsCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.pageController.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    func assignToUI(response: DetailResponse) {
        rateLabel.text = "\(response.data?.product?.rate ?? 0)"
        nameLabel.text = response.data?.product?.name ?? ""
        self.title = response.data?.product?.name ?? ""
        priceLabel.text = (response.data?.product?.price ?? "")+" جنيه"
        describtionLabel.text = response.data?.product?.bio ?? ""
        capacityLabel.text = "أقل كم 512 ميجا بايت"
    }
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DetailsViewController: UICollectionViewDelegate {
    
}
extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colerCollectionView {
            return CGSize(width: 65, height: 45)
        }
        if collectionView == imgCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        return CGSize(width: 160, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageController.currentPage = indexPath.item
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == imgCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}
extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  anotherDealsCollectionView {
            return self.detailResponseData.data?.related?.count ?? 0
        }
        if collectionView == colerCollectionView {
            return self.detailResponseData.data?.product?.colors?.count ?? 0
        }
        return self.detailResponseData.data?.product?.imagees?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imgCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            cell.configCellDetails(data: self.detailResponseData.data?.product?.imagees?[indexPath.item])
            return cell
        }
        if collectionView == anotherDealsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeDealCell", for: indexPath) as! HomeDealCell
            cell.configRelatedData(data: self.detailResponseData.data?.related?[indexPath.item])
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as! ColorCell
        if indexPath.item == 0 {
            cell.layer.borderColor = UIColor.darkGray.cgColor
            cell.colorLabel.textColor = UIColor.darkGray
        }
        cell.configColorCell(data: self.detailResponseData.data?.product?.colors?[indexPath.item])
        return cell
    }
    
    
}
