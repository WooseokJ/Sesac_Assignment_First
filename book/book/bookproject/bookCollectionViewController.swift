
import UIKit
import Kingfisher
class bookCollectionViewController: UICollectionViewController {

    
    @IBOutlet weak var SearchButtonItem: UIButton!
    var bookList = bookInfo().bookcontent
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout() // 인스턴스생성
        let spacing : CGFloat = 0
        
        let layoutwidth = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: (layoutwidth / 2), height: (layoutwidth / 2))
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        // UIBarbutton
//        let image2 = UIImage(systemName: "magnifyingglass")
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image2, style: .plain, target: nil, action: nil)
//
        
        //UIButton
        SearchButtonItem.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
//        SearchButtonItem.setTitle("", for: .)
//        SearchButtonItem.

    }
    
 
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCollectionViewCell", for: indexPath) as! bookCollectionViewCell

        let bookdata = bookList[indexPath.row]
        cell.configureCell(bookdata)
        
        
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("detail")
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
 
    }
    
    
    
    
    @IBAction func SearchButton(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SearchViewController.identifier) as! SearchViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav,animated: true)
    }
    
    

}
