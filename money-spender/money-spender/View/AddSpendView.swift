//
//  AddSpendView.swift
//  money-spender
//
//  Created by Marcin Rosół on 12/11/2020.
//

import UIKit

class AddSpendView: UIView {

    // MARK: - properties
    let scrollView = UIScrollView()
    let contentView = UIView()

    let topController = AddTransactionHeader()
    let dateController = DateTransation()
    let descriptionController = DescriptionTransaction()
    
    let controller = AddSpendViewController()
    // MARK: -
    let stackContentView: UIStackView = {
        let stackContentView = UIStackView()
        stackContentView.axis = .vertical
        stackContentView.spacing = 0
        stackContentView.alignment = .fill
        stackContentView.distribution = .equalSpacing
        return stackContentView
    }()
    
    let tapGesture = UITapGestureRecognizer()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        doLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - function
    fileprivate func doLayout() {
        backgroundColor = .systemBackground
    
        addGestureRecognizer(tapGesture)
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(stackContentView)
        stackContentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
        stackContentView.addArrangedSubview(topController)
        stackContentView.addArrangedSubview(dateController)
        stackContentView.addArrangedSubview(descriptionController)
    }
}
