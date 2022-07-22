//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/07/18.
//

import UIKit

enum SettingOptions:Int,CaseIterable{
    case total,personal,others   //색션에대한 케이스 , 0,1,2가 default로 들어가있음.
    var sectionTitle : String  {
        switch self{ // self로 각각케이스
            case .total: return "전체설정"
            case .personal:return "개인설정"
            case .others:return "기타"
        }
    }
    
    var rowTitle : [String]{
        switch self {
        case .total:
            return ["공지사항","실험실","버전정보"]
        case .personal:
            return ["개인/보안","알림","채팅","멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}



class SettingTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(SettingOptions.allCases[0]) //total
        print(SettingOptions.allCases.count) // 3
        print(SettingOptions.allCases) // [TrendMedia.SettingOptions.total, TrendMedia.SettingOptions.personal, TrendMedia.SettingOptions.others]
        print(SettingOptions.allCases[0].sectionTitle) // 전체설정
        print(SettingOptions.allCases[0].sectionTitle.count) //4
    }
//
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count //( allCases까지 배열이됨.그래서 count도 쓸수있어)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*if section == 0{
            return SettingOptions.allCases[0].rowTitle.count
        }else if section == 1{
            return SettingOptions.allCases[1].rowTitle.count
        }*/
        return SettingOptions.allCases[section].rowTitle.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell2")!
        
        /* SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row] 설명 
        switch indexPath.row {
            case 0: cell.textLabel?.text = SettingOptions.allCases[0].rowTitle[0] //공지사항 , allcases[0] 까진 total
            case 1: cell.textLabel?.text = SettingOptions.allCases[0].rowTitle[1] //실험실
            default: cell.textLabel?.text = SettingOptions.allCases[0].rowTitle[2] //버전정보
        }
        switch indexPath.section{
            case 0 : cell.textLabel?.text = SettingOptions.allCases[0]
        }
        */
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].sectionTitle
    }
    
    
    /* 내풀이
    let sectionHeader = ["전체설정","개인설정","기타"]
    let allsetting = ["공지사항","실험실","버전정보"]
    let privateSetting = ["개인/보안","알림","채팅","멀티프로필"]
    let etc  = ["고객센터/도움말"]
    let cellCount = [3,4,1]

    // 색션 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    // 해더
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    // cell 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount[section]
    }
    // footer
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "푸터영역"
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell2")!
        switch indexPath.section {
            case 0 :cell.textLabel?.text = allsetting[indexPath.row]
            case 1 :cell.textLabel?.text = privateSetting[indexPath.row]
            default:cell.textLabel?.text = etc[indexPath.row]
        }
        return cell
        
    }
     */

}
