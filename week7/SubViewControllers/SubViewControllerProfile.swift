//
//  SubViewController1.swift
//  week7
//
//  Created by 홍기정 on 5/21/25.
//

import Foundation
import SnapKit

class SubViewControllerProfile: UIViewController{
    
    var sectionLabelText: String?
    var rowLabelText: String?
    
    let backgroundSubview = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let sectionLabel = {
        let label = UILabel()
        label.font = UIFont(name: "PretendardGOV-Bold", size: 30)
        label.textColor = .black
        return label
    }()
    let rowLabel = {
        let label = UILabel()
        return label
    }()
    
    private func bindLabel(){
        guard let sectionLabelText else { return }
        sectionLabel.text = sectionLabelText
        
        guard let rowLabelText else { return }
        rowLabel.text = rowLabelText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .navigation
        
        view.addSubview(backgroundSubview)
        backgroundSubview.addSubview(sectionLabel)
        backgroundSubview.addSubview(rowLabel)
        
        backgroundSubview.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        sectionLabel.snp.makeConstraints{
            $0.center.equalTo(view.center)
        }
        rowLabel.snp.makeConstraints{
            $0.center.equalTo(view.center)
        }
    }
    
}
