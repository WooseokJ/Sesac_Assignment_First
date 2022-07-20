//
//  bookCollectionViewCell.swift
//  book
//
//  Created by useok on 2022/07/20.
//

import UIKit



class bookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var unitView: UIView!
    
    
    
    func configureCell(_ data: book){
        posterImage.image = UIImage(named: data.bookImage)
        pageLabel.text! = data.bookTitle
//        let color : UIColor = [.red , .yellow , .blue]
        unitView.backgroundColor = .red
    }
    
}
