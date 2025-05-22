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
    lazy var headers = data.headers
    lazy var rows = data.rows
    
    // component
    let tableView = UITableView(frame: .zero, style: .grouped) // .plain) // .plain은 tableView(viewForHeaderInSection 무시된다

    // lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .navigation
        // self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = .navigation
        
        setTableView()
        register()
    }
}
extension MainTableViewController {
    // ===== Header =====
    // header 개수 (section)
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    // custom header 반환
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UITableViewHeaderFooterView? {
        // 1. header 생성/추출
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyTableViewHeader.identifier) as? MyTableViewHeader
        else { print("header_else"); return UITableViewHeaderFooterView() }
        // 2.
        print("header_gaurd")
        header.dataBind("header")//headers[section])
        return header
    }
    // header height 설정하기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 308
    }
    
    // ===== Cell =====
    // cell 개수 (rows)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section].count
    }
    // custome cell 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. cell 생성/추출
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell
        else { return UITableViewCell() }
        // 2. data bind
        cell.dataBind((rows[indexPath.section][indexPath.row]))
        // 3. cell 반환
        return cell
    }
    // cell height 설정하기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    // cell action 설정하기 - 검색해보면서 했습니다.. 하는중..
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let header = headers[indexPath.section]
        let row = rows[indexPath.section][indexPath.row]
        
        let subVC = {
            let subVC = SubViewController()
            subVC.dataBind(header: header, row: row)
            return subVC
        }()
        
        navigationController?.pushViewController(subVC, animated: true)
     
        
        // cell을 tap한 뒤, 회색으로 select된 것을 바로 deselect하기
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
    
extension MainTableViewController {
    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    private func register(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.register(MyTableViewHeader.self, forHeaderFooterViewReuseIdentifier: MyTableViewHeader.identifier
        )
    }
}
