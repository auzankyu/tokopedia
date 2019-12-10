//
//  FilterVC.swift
//  Product
//
//  Created by Auzan Lazuardi on 01/12/19.
//  Copyright © 2019 Auzan Lazuardi. All rights reserved.
//

import UIKit
import TokopediaUIKit
import RangeSeekSlider
import MaterialComponents.MaterialChips

class FilterVC: UIViewController {

    @IBOutlet var filterView: UIView!
    @IBOutlet weak var applyButton: TokopediaUIButton!
    @IBOutlet weak var minimumTextField: UITextField!
    @IBOutlet weak var maximumTextField: UITextField!
    @IBOutlet weak var priceSlider: RangeSeekSlider!
    @IBOutlet weak var filterChipsData: UICollectionView!
    @IBOutlet weak var wholeSaleSwitcher: UISwitch!
    
    var presenter: FilterViewToPresenter?
    var category: [Category]?
    var obj: [String] = []
    var payload: [String:Any] = [
        "q": "samsung",
        "pmin": "0",
        "pmax": "8000000",
        "wholesale": false,
        "official": false,
        "fshop": "0",
        "start": "0",
        "rows": "10"
    ]
    
    public init() {
        super.init(nibName: "FilterVC", bundle: Bundle(for: FilterVC.self))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        priceSlider.setNeedsDisplay()
    }
    
    func setup() {
        let viewController = self
        var presenter: FilterViewToPresenter = FilterPresenter()
        let router: FilterPresenterToRouter = FilterRouter()
        
        viewController.presenter = presenter
        presenter.router = router
    }
    
    func setupViewLayout() {
        filterView.backgroundColor = TokopediaUIColor.shared.color(of: .background)
        
        priceSlider.delegate = self
        priceSlider.enableStep = true
        priceSlider.step = 50000
        
        filterChipsData.register(MDCChipCollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        filterChipsData.delegate = self
        filterChipsData.dataSource = self
        
        setupMinTextFieldLayout()
        setupMaxTextFieldLayout()
        getData()
    }
    
    func setupMinTextFieldLayout() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: minimumTextField.frame.height - 1, width: minimumTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
        minimumTextField.borderStyle = .none
        minimumTextField.text = "Rp 0"
        minimumTextField.isEnabled = false
        minimumTextField.layer.addSublayer(bottomLine)
    }
    
    func setupMaxTextFieldLayout() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: maximumTextField.frame.height - 1, width: maximumTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
        maximumTextField.borderStyle = .none
        maximumTextField.text = "Rp 8.000.000"
        maximumTextField.isEnabled = false
        maximumTextField.textAlignment = .right
        maximumTextField.layer.addSublayer(bottomLine)
    }
    
    func getData() {
        if let category = category {
            for item in category {
                if item.selected == true {
                    obj.append(item.name!)
                }
            }
            for obj in obj {
                if obj == "Official Store" {
                    payload["official"] = true
                }
                if obj == "Gold Merchant" {
                    payload["fshop"] = 2
                }
            }
        }
    }

    //MARK: Button Pressed
    @IBAction func applyPressed(_ sender: Any) {
        presenter?.routeToProductList(viewController: self, object: payload)
    }
    
    @IBAction func wholeSaleSwitcher(_ sender: Any) {
        
        if let wholeSale = wholeSaleSwitcher {
            if wholeSale.isOn == true {
                payload["wholesale"] = true
            } else {
                payload["wholesale"] = false
            }
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        presenter?.routeToPrev(viewController: self)
    }
    
    @IBAction func categoryPressed(_ sender: Any) {
        if let category = category {
            presenter?.routeToCategory(viewController: self, object: category)
        } else {
            presenter?.routeToCategory(viewController: self)
        }
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        minimumTextField.text = "Rp 0"
        maximumTextField.text = "Rp 8.000.000"
        priceSlider.selectedMinValue = 0
        priceSlider.selectedMaxValue = 8000000

        wholeSaleSwitcher.isOn = false
        obj.removeAll()
        filterChipsData.reloadData()
        
        payload["pmin"] = 0
        payload["pmax"] = 8000000
        payload["wholesale"] = false
        payload["official"] = false
        payload["fshop"] = 0
    }
    
    
    @objc func deletePressed(_ sender: UIButton!) {
        
        if sender.tag == 1 {
            if obj.count == 1 {
                category![1].selected = false
                payload["official"] = false
                obj.remove(at: 0)
            } else {
                category![1].selected = false
                payload["official"] = false
                obj.remove(at: 1)
            }
        } else {
            category![sender.tag].selected = false
            payload["fshop"] = 0
            obj.remove(at: sender.tag)
        }
        filterChipsData.reloadData()
    }
}

extension FilterVC: RangeSeekSliderDelegate {
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        let minValueChanged = TokopediaNumber.shared.formatNumber(value: Int(minValue))
        let maxValueChanged = TokopediaNumber.shared.formatNumber(value: Int(maxValue))
        minimumTextField.text = "Rp \(minValueChanged)"
        maximumTextField.text = "Rp \(maxValueChanged)"
        payload["pmin"] = Int(minValue)
        payload["pmax"] = Int(maxValue)
    }
}

extension FilterVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        obj.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = filterChipsData.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! MDCChipCollectionViewCell
                
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "icons8-delete-50", in: Bundle(for: FilterVC.self), with: nil), for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        
        switch obj[indexPath.row] {
            case "Official Store":
                button.tag = 1
                break
            default:
                button.tag = indexPath.row
        }
        
        button.addTarget(self, action: #selector(deletePressed), for: .touchUpInside)
        
        let chipView = cell.chipView
        chipView.titleLabel.text = obj[indexPath.row]
        chipView.setTitleColor(UIColor.red, for: .selected)
        chipView.accessoryView = button
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.filterChipsData.bounds.width / 2.1, height: 40)
    }
}
