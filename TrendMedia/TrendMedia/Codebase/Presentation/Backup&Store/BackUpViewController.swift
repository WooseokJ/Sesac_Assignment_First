//
//  BackUpViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/08/25.
//

import UIKit
import Zip

@available(iOS 14.0, *)
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
    @available(iOS 14.0, *)
    // 복구하기버튼클릭시
    @objc func storeClicked() {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true) //반드시 파일앱에 저장해야함 ascopy
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        self.present(documentPicker,animated: true)
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
        print("backupURL44",backupURL)  // data/Containers/Data/Applicati ... lt.realm
        urlPaths.append(backupURL)
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "sesac")
            print("zipFilePath33",zipFilePath)
            showActivity()
        } catch {
            showAlert(title: "압축실패")
        }
    }
    // 백업파일 저장하는 모달띄우기
    func showActivity() {
        guard let path = documentDirectoryPath() else {
            showAlert(title: "도큐먼트 위치 오류")
            return
        }
        // path: ~/Documents/
        let backupURL = path.appendingPathComponent("sesac.zip")
        print("backupURL222:",backupURL) // ~/Documents/sesac.zip
        let vc = UIActivityViewController(activityItems: [backupURL], applicationActivities: [])
        self.present(vc,animated: true)
    }
    

    
    
}

@available(iOS 14.0, *)
extension BackUpViewController: UIDocumentPickerDelegate {
    //취소누르면
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("도큐먼트피커 닫음")
    }
    // 경로선택시
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectFildURL = urls.first else { //압축파일(파일앱zip)선택한파일있는지확인 ~fileapp/foder
            showAlert(title: "선택한파일찾을수없음")
            return
        }
        //tmp/com.sesac.TrendMedia-Inbox/sesac.zip
        print("selectedFieldURL",selectFildURL)
        
        guard let path = documentDirectoryPath() else { //보낼위치(나의앱 도큐먼트)가 맞는지
            showAlert(title: "도큐먼트 위치 오류")
            return
        }
        print("path",path)  //  ~/documents/
        let sandboxFileURL = path.appendingPathComponent(selectFildURL.lastPathComponent)
        // ~/Documents/sesac.zip
        print("sandboxFileURL",sandboxFileURL)
        
        // 파일이 존재할떄 압축풀기
        if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
            let fileURL = path.appendingPathComponent("sesac.zip") //
            print("fileURL",fileURL)
            do{
                // 알집파일열기
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress",progress)
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile",unzippedFile)
                    self.showAlert(title: "복구완료")
                })
            }
            catch {
                showAlert(title: "압축해제실패")
            }
        }
        // 파일없으면
        else{
            do {
                // 파일앱 zip -> document 폴더 복사
                try FileManager.default.copyItem(at: selectFildURL, to: selectFildURL)
                let fileURL = path.appendingPathComponent("sesac.zip")
                // ~fileapp/foder/sesac.zip
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil,progress: { progress in
                    print("progress",progress)
                },fileOutputHandler: { unzippedFile in
                    print("unzippedFile",unzippedFile)
                    self.showAlert(title: "복구완료")
                })
            }
            
            catch {
                showAlert(title: "압축해제실패")
            }
        }
    }
}
