//
//  ViewController.swift
//  week7
//
//  Created by 홍기정 on 5/21/25.
//

import UIKit
import SnapKit

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // data
    let data = TableViewModel.dummy()
    lazy var headers = data.headers
    lazy var rows = data.rows
    
    // component
    let tableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.sectionHeaderTopPadding = 0 // ios15 부터는 header padding이 있다
        tv.separatorInset = .zero // 기본 separator inset 없애기
        return tv
    }()
    

    // lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        //setNavigationBar()
        register()
    }
}

extension MyTableViewController { // Header
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // 1. header 생성/추출
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyTableViewHeader") as? MyTableViewHeader
        else { return nil }
        // 2. dataBind
        if let header = headers[section] {
            headerView.dataBind(header)
        }
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (headers[section] == nil) { return .leastNonzeroMagnitude }
            else { return 38 }
    }
}


extension MyTableViewController { // Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. cell 생성/추출
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell
        else { return UITableViewCell() }
        // 2. data bind
        cell.dataBind((rows[indexPath.section][indexPath.row]))
        // 3. setLayout
        cell.setLayout(headers[indexPath.section])
        // 4. accessory view
        cell.setAcceossory(header: headers[indexPath.section])
        // 4. cell 반환
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    // Action
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let headerText: String? = headers[indexPath.section]
        let rowText = rows[indexPath.section][indexPath.row]
        
        let subVC = {
            let subVC = MySubViewController()
            subVC.dataBind(header: headerText, row: rowText)
            return subVC
        }()
        
        navigationController?.pushViewController(subVC, animated: true)
        
        // cell을 tap한 뒤, 회색으로 select된 것을 바로 deselect하기
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // accessory view
    
}
extension MyTableViewController {
    // Layout
    private func setTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    /*
    // set navigation bar
    private func setNavigationBar(){
        self.navigationItem.title = "설정"
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    */
    // delegate, dataSource
    // register
    private func register(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.register(MyTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "MyTableViewHeader"
        )
    }
}
