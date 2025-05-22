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
    let tableView = UITableView(frame: .zero, style: .plain)

    // lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .navigation
        // self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = .navigation
        
        setTableView()
        register()
    }
}
extension MainTableViewController { // tableView methods
    // section 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    // 각 section의 row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section].count
    }
    
    // row에 대입할 cell 반환 (custome cell, reuse)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell 생성/추출
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell
        else { return UITableViewCell() }
        
        // data bind
        cell.dataBind((rows[indexPath.section][indexPath.row]))
        
        // cell 반환
        return cell
    }
    // header 반환
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)-> String? {
        return headers[section]
    }
    
    // cell height 설정하기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    // tap했을 때 action 설정하기
    // 검색해보면서 했습니다..
    // 하는중..
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSection = headers[indexPath.section]
        let selectedRow = rows[indexPath.section][indexPath.row]
        
        /*
        let nextVC = {
            switch selectedRow {
            case "프로필": return SubViewControllerProfile() as UIView
            default: return SubViewControllerProfile()
            }
        }
         */
        var nextVC = SubViewController()
        nextVC.sectionLabelText = selectedRow
        nextVC.rowLabelText = selectedRow
        navigationController?.pushViewController(nextVC, animated: true)
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
