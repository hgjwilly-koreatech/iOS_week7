//
//  SubViewController1.swift
//  week7
//
//  Created by 홍기정 on 5/21/25.
//

import Foundation
import SnapKit

class MySubViewController: UIViewController{
    
    // data
    var headerLabelText: String?
    var rowLabelText: String?

    // component
    let label = {
        let label = UILabel()
        label.font = UIFont(name: "PretendardGOV-SemiBold", size: 24)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    // lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    func dataBind(header: String?, row: String){
        if(header == nil) { label.text = "Cell: \(row)" }
        else { label.text = "Header: \(header!)\nCell: \(row)" }
    }
}
