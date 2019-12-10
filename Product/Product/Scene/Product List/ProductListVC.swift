//
//  ProductListVC.swift
//  Product
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import UIKit
import TokopediaUIKit
import Core

class ProductListVC: UIViewController {

    @IBOutlet weak var productsView: UICollectionView!
    @IBOutlet weak var filterButton: TokopediaUIButton!
    
    var presenter: ProductListViewToPresenter?
    var activityIndicator = TokopediaUILoadingView()
    var datas: [Datas] = []
    var obj: [String:Any]?
    var totalData = 10
    var loading = false
    
    public init() {
        super.init(nibName: "ProductListVC", bundle: Bundle(for: ProductListVC.self))
        setup()
        obj = [
            "q": "samsung",
            "pmin": "10",
            "pmax": "8000000",
            "wholesale": "false",
            "official": "false",
            "fshop": "0",
            "start": "0",
            "rows": "10"
        ]
    }
    
    public init(object: [String:Any]) {
        super.init(nibName: "ProductListVC", bundle: Bundle(for: ProductListVC.self))
        setup()
        obj = object.compactMapValues({ $0 })
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        if let obj = obj {
            presenter?.doQueryProduct(payload: obj)
        }
    }
    
    func setup() {
        let viewController = self
        var presenter: ProductListViewToPresenter & ProductListInteractorToPresenter = ProductListPresenter()
        var interactor: ProductListPresenterToInteractor = ProductListInteractor()
        let router: ProductListPresenterToRouter = ProductListRouter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
    }
    
    func setupCollection() {
        productsView.register(UINib(nibName: "ProductCell", bundle: Bundle(for: ProductCell.self)), forCellWithReuseIdentifier: "cells")
        showActivityIndicator()
    }
    
    //MARK: Show activity indicator
    func showActivityIndicator() {
        self.view.addSubview(self.activityIndicator)
    }
    
    //MARK: Remove activity indicator
    func removeActivityIndicator() {
        self.activityIndicator.removeFromSuperview()
    }
    
    func showAlert() {
        TokopediaUIAlert.show(in: self, alertTitle: AlertResponse.connectionError.errorTitle, alertMessage: AlertResponse.connectionError.errorMessage, buttonTitle: AlertResponse.errorButton)
    }
    
    func loadMore(start: Int) {
    
        self.obj!["start"] = start
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.presenter?.doQueryProduct(payload: self.obj!)
            self.loading = false
            self.totalData = self.totalData + 10
        }
    }
    
    @IBAction func filterPressed(_ sender: Any) {
        presenter?.routeToFilter(viewController: self)
    }

}

extension ProductListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalData
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productsView.dequeueReusableCell(withReuseIdentifier: "cells", for: indexPath) as! ProductCell
        cell.titleLabel.text = self.datas[indexPath.row].name
        cell.priceLabel.text = self.datas[indexPath.row].price
        cell.productImage.load(url: (self.datas[indexPath.row].image)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !loading && indexPath.row == totalData - 1 {
            self.loading = true
            showActivityIndicator()
            loadMore(start: totalData + 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 1, height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 1
    }
}

extension ProductListVC: ProductListPresenterToView {
    func showSuccess(product: Product) {
        for item in product.data! {
            self.datas.append(item)
        }
        productsView.delegate = self
        productsView.dataSource = self
        productsView.reloadData()
        removeActivityIndicator()
    }
    
    func showError() {
        showAlert()
        removeActivityIndicator()
    }
}

//MARK: For display image from URL
extension UIImageView {
    func load(url: String) {
        let myUrl = URL(string: url)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: myUrl!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
