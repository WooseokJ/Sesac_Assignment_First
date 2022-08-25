

import UIKit

class CodeShoppingDetailViewController: BaseViewController {

    let detailview = CodeShoppingDetailView()
    
    var labelContent: String?
    
    override func loadView() {
        super.view = detailview
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        detailview.textLabel.text = labelContent
    }
    
    


}
