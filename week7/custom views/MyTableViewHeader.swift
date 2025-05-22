//
//  MyTableViewHeader.swift
//  week7
//
//  Created by 홍기정 on 5/22/25.
//

import Foundation
import SnapKit

class MyTableViewHeader: UITableViewHeaderFooterView {
    
    static let identifier = "MyTableViewHeader"
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "PretendardGOV-SemiBold", size: 14)
        return label
    }()
    
    func dataBind(_ section: String){
        headerLabel.text = section
        print("dataBind executed")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: MyTableViewCell.identifier)
        
        contentView.backgroundColor = .black
        contentView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(24)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
