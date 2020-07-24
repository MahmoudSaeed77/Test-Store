//
//  ViewController.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bestCollectionView: UICollectionView!
    @IBOutlet weak var updatedCollectionView: UICollectionView!
    @IBOutlet weak var catCollectionView: UICollectionView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    
    
    private var viewModel: HomeViewModel!
    
    var homeResponseData = HomeResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = HomeViewModel(view: self)
        setupCollections()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let logo = UIBarButtonItem(image: UIImage(named: "logo_ac")?.withRenderingMode(.alwaysOriginal), landscapeImagePhone: UIImage(named: "logo_ac")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        let menu = UIBarButtonItem(image: UIImage(named: "ic_menu")?.withRenderingMode(.alwaysOriginal), landscapeImagePhone: UIImage(named: "ic_menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [menu, logo]
    }
    
    fileprivate func setupCollections() {
        bestCollectionView.delegate = self
        bestCollectionView.dataSource = self
        
        updatedCollectionView.delegate = self
        updatedCollectionView.dataSource = self
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        catCollectionView.delegate = self
        catCollectionView.dataSource = self
        
        bestCollectionView.register(UINib(nibName: "HomeDealCell", bundle: nil), forCellWithReuseIdentifier: "HomeDealCell")
        updatedCollectionView.register(UINib(nibName: "HomeDealCell", bundle: nil), forCellWithReuseIdentifier: "HomeDealCell")
        
        self.bestCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.updatedCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.bannerCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.catCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }

    func AssignToUI(response: HomeResponse) {
        
    }

}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == bestCollectionView || collectionView == updatedCollectionView {
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            if collectionView == bestCollectionView {
                vc.productId = self.homeResponseData.data?.offers?[indexPath.item].id ?? 0
            } else {
                vc.productId = self.homeResponseData.data?.products?[indexPath.item].id ?? 0
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == catCollectionView {
            return CGSize(width: 100, height: 55)
        }
        if collectionView == bannerCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        return CGSize(width: 160, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == bannerCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bestCollectionView {
            return self.homeResponseData.data?.offers?.count ?? 0
        }
        if collectionView == catCollectionView {
            return self.homeResponseData.data?.categories?.count ?? 0
        }
        if collectionView == bannerCollectionView {
            return self.homeResponseData.data?.banner?.count ?? 0
        }
        return self.homeResponseData.data?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bestCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeDealCell", for: indexPath) as! HomeDealCell
            cell.configData(data: homeResponseData.data?.offers?[indexPath.item])
            return cell
        }
        if collectionView == catCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatgoriesCell", for: indexPath) as! CatgoriesCell
            cell.configCell(data: homeResponseData.data?.categories?[indexPath.item])
            return cell
        }
        if collectionView == bannerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            cell.configCell(data: homeResponseData.data?.banner?[indexPath.item])
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeDealCell", for: indexPath) as! HomeDealCell
        cell.configProductData(data: homeResponseData.data?.products?[indexPath.item])
        return cell
        
    }
    
    
}
