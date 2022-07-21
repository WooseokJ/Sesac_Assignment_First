//
//  bookCollectionViewCell.swift
//  book
//
//  Created by useok on 2022/07/20.
//

import UIKit
import Kingfisher


class bookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
//
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var unitView: UIView!
    
    
    
    func configureCell(_ data: book){
        posterImage.image = UIImage(named: data.bookImage)
        TitleLabel.text! = data.bookTitle
        pageLabel.text! = data.bookNum
        let color : [UIColor] = [.systemMint , .systemBrown , .systemGray3 , .lightGray, .orange, .green ,.yellow, .systemCyan]
        
        unitView.backgroundColor = color[2]
        let url = URL(string: data.bookImage)
        posterImage.kf.setImage(with:url)
                
    }
    
}
