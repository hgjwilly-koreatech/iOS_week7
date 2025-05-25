//
//  TableViewCell.swift
//  week7
//
//  Created by 홍기정 on 5/21/25.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    // identifier
    static let identifier = "MyTableViewCell"
    
    // component
    let titleLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "PretendardGOV-SemiBold", size: 16)
        return label
    }()
    
    // initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyTableViewCell {
        
    func dataBind(_ text: String){
        titleLabel.text = text
    }
    
    func setLayout(_ hasHeader: String?){
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{
            //$0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(24)
            //$0.trailing.equalToSuperview()
            $0.center.equalToSuperview()
        }
        if(hasHeader == nil) {
            titleLabel.textAlignment = .center
        }
    }
    
    func setAcceossory(header: String?){
        guard header == "일반" else {
            accessoryView = nil
            return
        }
        let arrowImage = UIImage(named: "arrow_forward_ios")
        let arrowImageView = UIImageView(image: arrowImage)
        accessoryView = arrowImageView
    }
    
}
