//
//  TransactionCellComponent.swift
//  money-spender
//
//  Created by Marcin Rosół on 05/12/2020.
//

import UIKit

class TransactionCellComponent: UITableViewCell  {
    
    var transactionViewModel : TransactionCellViewModel! {
        didSet{
            transactionCategory.text = transactionViewModel?.category.description
            transactionDate.text = transactionViewModel?.date.description
            transactionIncome.text = transactionViewModel?.price.description
        }
    }
    
    // MARK: - declarations
    
    let transactionCategory : UILabel = {
        let transactionCategory = UILabel()
        return transactionCategory
    }()
    
    let transactionDate : UILabel = {
        let transactionDate = UILabel()
        return transactionDate
    }()
    
    let transactionIncome : UILabel = {
        let transactionIncome = UILabel()
        return transactionIncome
    }()
    
    
    // MARK: - initial
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        doLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - functions
        
    func doLayout(){
        addSubview(transactionCategory)
        transactionCategory.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        addSubview(transactionDate)
        transactionDate.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        addSubview(transactionIncome)
        transactionIncome.snp.makeConstraints { make in
            make.top.equalTo(transactionCategory.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
