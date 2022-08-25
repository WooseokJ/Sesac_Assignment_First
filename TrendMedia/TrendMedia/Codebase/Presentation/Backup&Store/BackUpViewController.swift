//
//  BackUpViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/08/25.
//

import UIKit
import Zip

class BackUpViewController: UIViewController {
    
    let backupView = BackupView()
    
    override func loadView() {
        super.view = backupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 버튼 액션 연결
        backupView.backupButton.addTarget(self, action: #selector(backupButtonClicked), for: .touchUpInside)
        backupView.cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        backupView.storeButton.addTarget(self, action: #selector(storeClicked), for: .touchUpInside)
        
        // 테이블뷰 연결
        backupView.tableview.delegate = self
        backupView.tableview.dataSource = self
        
        
    }
    
    //MARK: 버튼 클릭시
    // 뒤로가기 클릭시
    @objc func cancelButtonClicked() {
        dismiss(animated: true)
    }
    // 백업버튼클릭시
    @objc func backupButtonClicked() {
        backupButtonExcute()
    }
    // 복구하기버튼클릭시
    @objc func storeClicked() {
        print(2)
    }
    
    //MARK: 백업
    func backupButtonExcute() {
        var urlPaths : [URL] = []
        //document 위치 백업파일 확인
        guard let path = documentDirectoryPath() else {
            showAlert(title: "document 위치 오류")
            return
        }
        print("path:",path) // ~/Documents/
        
        let realFile = path.appendingPathComponent("default.realm")
        // ~/Documents/default.realm
        
        // 백업파일 존재유무
        guard FileManager.default.fileExists(atPath: realFile.path) else {
            showAlert(title: "백업파일 없음")
            return
        }
        
        let backupURL = URL(string: realFile.path)!
        print("backupURL",backupURL)
        urlPaths.append(backupURL)
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "백업파일")
            print("zipFilePath",zipFilePath)
            showActivity()
        } catch {
            showAlert(title: "압축실패")
        }
    }
    
    func showActivity() {
        guard let path = documentDirectoryPath() else {
            showAlert(title: "도큐먼트 위치 오류")
            return
        }
        // path: ~/document/
        let backupURL = path.appendingPathComponent("백업파일")
        print("backupURL222:",backupURL)
        let vc = UIActivityViewController(activityItems: [backupURL], applicationActivities: [])
        self.present(vc,animated: true)
    }
    
}
