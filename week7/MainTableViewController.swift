//
//  ViewController.swift
//  week7
//
//  Created by 홍기정 on 5/21/25.
//

import UIKit
import SnapKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // data
    let data = TableViewModel.dummy()
    lazy var headers = data.sections
    lazy var rows = data.rows
    
    // tableView
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .navigation
        
        setTableView()
        register()
    }
}
extension MainTableViewController { // tableView methods
    // section 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.sections.count
    }
    // row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.rows[section].count
    }
    
    // cell 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell
        else { return UITableViewCell() }
        
        cell.dataBind("test") //(rows[indexPath.section][indexPath.row])
        return cell
    }
    // header 반환
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)-> String? {
        return headers[section]
    }
    
    // height 설정하기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    // tap했을 때 action 설정하기
    // 검색해보면서 했습니다..
    // 하는중..
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSection = headers[indexPath.section]
        let selectedItem = rows[indexPath.section][indexPath.row]
        
        let nextVC = {
            switch selectedItem {
            case "프로필": return SubViewControllerProfile()
            default: return SubViewControllerProfile()
            }
        }
        navigationController?.pushViewController(nextVC(), animated: true)
    }
    
}
    
extension MainTableViewController {
    
    private func setTableView() {
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            //$0.leading.bottom.trailing.equalToSuperview()
            //$0.top.equalTo(view.safeAreaLayoutGuide)
            $0.edges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func register(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
    }
}
