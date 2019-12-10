//
//  CategoryVC.swift
//  Product
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import UIKit
import TokopediaUIKit

class CategoryVC: UIViewController {

    @IBOutlet weak var categoryTbl: UITableView!
    @IBOutlet weak var applyButton: TokopediaUIButton!
    
    var presenter: CategoryViewToPresenter?
    var category: [Category] = []
    
    public init() {
        super.init(nibName: "CategoryVC", bundle: Bundle(for: CategoryVC.self))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setup() {
        let viewController = self
        var presenter: CategoryViewToPresenter = CategoryPresenter()
        let router: CategoryPresenterToRouter = CategoryRouter()
        
        viewController.presenter = presenter
        presenter.router = router
    }
    
    func setupTable() {
        setData()
        categoryTbl.register(UITableViewCell.self, forCellReuseIdentifier: "categoryCell")
        categoryTbl.delegate = self
        categoryTbl.dataSource = self
        categoryTbl.allowsMultipleSelection = true
        categoryTbl.reloadData()
        categoryTbl.frame = CGRect(x: categoryTbl.frame.origin.x,
                                     y: categoryTbl.frame.origin.y,
                                     width: categoryTbl.frame.size.width,
                                     height: categoryTbl.contentSize.height)
    }
    
    //MARK: create category data
    func setData() {
        if self.category.count == 0 {
            var category1: Category = Category()
            category1.name = "Gold Merchant"
            category1.selected = false
            self.category.append(category1)

            var category2: Category = Category()
            category2.name = "Official Store"
            category2.selected = false
            self.category.append(category2)
        }
    }
    
    //MARK: button pressed
    @IBAction func closePressed(_ sender: Any) {
        presenter?.routeToPrev(viewController: self)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        for i in 0 ..< categoryTbl.numberOfSections {
            for j in 0 ..< categoryTbl.numberOfRows(inSection: i) {
                if let cell = categoryTbl.cellForRow(at: NSIndexPath(row: j, section: i) as IndexPath) {
                    cell.accessoryType = .none
                    self.category[j].selected = false
                }
            }
        }
    }
    
    @IBAction func applyPressed(_ sender: Any) {
        presenter?.routeToFilter(viewController: self, object: self.category)
    }
    
}

extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTbl.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = self.category[indexPath.row].name
        cell.selectionStyle = .none
        cell.accessoryType = self.category[indexPath.row].selected == false ? .none : .checkmark
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = categoryTbl.cellForRow(at: indexPath as IndexPath) {
            cell.accessoryType = .checkmark
            self.category[indexPath.row].selected = true
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = categoryTbl.cellForRow(at: indexPath as IndexPath) {
            cell.accessoryType = .none
            self.category[indexPath.row].selected = false
        }
    }

}


