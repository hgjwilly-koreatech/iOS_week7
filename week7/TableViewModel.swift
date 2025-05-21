//
//  TableViewModel.swift
//  week7
//
//  Created by 홍기정 on 5/21/25.
//

import Foundation

struct TableViewModel {
    
    let sections = ["일반", "서비스"]
    let rows = [["프로필", "비밀번호 변경", "알림"],
                ["개인정보 처리방침", "코인 이용약관", "마케팅 수신 동의 약관", "오픈소스 라이선스"]]
    
    static func dummy() -> TableViewModel {
        return TableViewModel()
    }
    
}
