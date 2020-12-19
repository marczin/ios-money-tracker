//
//  ListComponent.swift
//  money-spender
//
//  Created by Marcin Rosół on 05/12/2020.
//

import UIKit

class ListComponent: UIView{
    
    
    // MARK: - declaration
    
    let tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Initial
    
    init() {
        super.init(frame: .zero)
        doLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - functions
    
    func doLayout(){
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
