//
//  MyTableViewHeader.swift
//  week7
//
//  Created by 홍기정 on 5/22/25.
//

import Foundation
import SnapKit

class MyTableViewHeader: UITableViewHeaderFooterView {
    
    // identifier
    static let identifier = "MyTableViewHeader"
    
    // component
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "PretendardGOV-Medium", size: 14)
        return label
    }()
    
    // dataBind
    func dataBind(_ section: String){
        headerLabel.text = section
        print("dataBind executed")
    }
    
    // initializer
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: Self.identifier)
        contentView.backgroundColor = .header
        contentView.addSubview(headerLabel)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyTableViewHeader {
    
    func setLayout(){
        headerLabel.snp.makeConstraints{
            //$0.top.equalToSuperview().inset(8)
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
    }
}
