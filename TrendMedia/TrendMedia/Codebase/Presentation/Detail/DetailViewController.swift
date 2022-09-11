

import UIKit
import Kingfisher
import RealmSwift

class DetailViewController: BaseViewController {
    //MARK: 뷰 가져오기
    let detailview = DetailView()
    var labelContent: String? // 셀 라벨명
    override func loadView() {
        super.view = detailview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        detailview.textLabel.text = labelContent
        detailview.imageButton.addTarget(self, action: #selector(imageButtonClicked), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveClicked))
        
  
        
    }
    //이미지 불러오기 버튼클릭
    @objc func imageButtonClicked() {
        let vc = ImageViewController()
        vc.delegate = self // self는 detailVC 전달
        transition(vc, transitionStyle: .presentFullNavigation)
    }
    // 뒤로가기 버튼 클릭시
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    //저장하기 버튼 클릭시 
    @objc func saveClicked() {
        dismiss(animated: true)
    }

    
}

protocol SelectImageDelegate {
    func sendImageData(image: String)
}
extension DetailViewController: SelectImageDelegate {
    func sendImageData(image: String) {
        let url = URL(string: image)
        detailview.imageView.kf.setImage(with: url)
        
    }
}
