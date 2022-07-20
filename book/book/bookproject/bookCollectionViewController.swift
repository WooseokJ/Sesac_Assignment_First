
import UIKit
import Kingfisher
class bookCollectionViewController: UICollectionViewController {

    var bookList = bookInfo().bookcontent
    let imageURL = "http://image.kyobobook.co.kr/images/book/xlarge/651/x9791162245651.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        let spacing : CGFloat = 5
        let layoutwidth = UIScreen.main.bounds.width - (spacing * 3)
        let layouthheight = UIScreen.main.bounds.height
        
        
        layout.itemSize = CGSize(width: (layoutwidth / 2), height: (layouthheight / 4))
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCollectionViewCell", for: indexPath) as! bookCollectionViewCell
        cell.posterImage.backgroundColor = .black
        let bookdata = bookList[indexPath.row]
        let url = URL(string: imageURL)
        cell.configureCell(bookdata)
        cell.posterImage.kf.setImage(with:url)

        
        return cell
    }

}
