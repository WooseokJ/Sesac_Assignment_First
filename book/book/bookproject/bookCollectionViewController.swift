
import UIKit
import Kingfisher
class bookCollectionViewController: UICollectionViewController {

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

}
