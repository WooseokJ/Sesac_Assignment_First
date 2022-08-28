

import UIKit

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
    }
    @objc func imageButtonClicked() {
        let vc = ImageViewController()
        transition(vc, transitionStyle: .presentFullNavigation)
    }
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    
    


}
