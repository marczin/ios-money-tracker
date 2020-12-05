//
//  AddSpendController.swift
//  money-spender
//
//  Created by Marcin Rosół on 12/11/2020.
//

import UIKit

class AddSpendViewController: UIViewController {
    
    // MARK: - properties
    
    let addSpendView = AddSpendView()
    
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    override func loadView() {
        view = addSpendView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSpendView.dateController.datepicker.addTarget(self, action: #selector(userPickDate(datePicker:)), for: .valueChanged)
        addSpendView.tapGesture.addTarget(self, action: #selector(viewTapped(gestureRecognizer:)))
        
        addSpendView.topController.categoryPicker.delegate = self
        addBarButtons()
    }
    
    
    //MARK: - funtion
    
    func addBarButtons(){

        addSpendView.topController.categoryField.addToolBar( title: "Done", style: .done, target: self, selector: #selector(doneTapped))
        addSpendView.topController.priceField.addToolBar( title: "Done", style: .done, target: self, selector: #selector(doneTapped))
        addSpendView.dateController.dateField.addToolBar( title: "Done", style: .done, target: self, selector: #selector(doneTapped))
        addSpendView.descriptionController.descriptionField.addToolBar( title: "Done", style: .done, target: self, selector: #selector(doneTapped))
    }
    
    
    @objc func userPickDate(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        addSpendView.dateController.dateField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func viewTapped(gestureRecognizer: UIGestureRecognizer){
        addSpendView.endEditing(true)
    }
    
    @objc func doneTapped(){
        addSpendView.endEditing(true)
    }
}

extension AddSpendViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Category(rawValue: row)?.description;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addSpendView.topController.categoryField.text = Category(rawValue: row)?.description
    }
    
    
}
