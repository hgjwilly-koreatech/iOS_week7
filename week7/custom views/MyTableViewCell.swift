//
//  TableViewCell.swift
//  week7
//
//  Created by 홍기정 on 5/21/25.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    let titleLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "PretendardGOV-SemiBold", size: 16)
        return label
    }()
    
    func dataBind(_ text: String){
        titleLabel.text = text
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview()
        }
    }
    
    
}
