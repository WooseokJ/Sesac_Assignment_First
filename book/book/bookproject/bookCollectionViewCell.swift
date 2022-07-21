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
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var unitView: UIView!
    
    
    
    func configureCell(_ data: book){
        posterImage.image = UIImage(named: data.bookImage)
        TitleLabel.text! = data.bookTitle
        pageLabel.text! = data.bookNum
        TitleLabel.numberOfLines = 1
        let r : CGFloat = CGFloat.random(in: 0...1)
        let g : CGFloat = CGFloat.random(in: 0...1)
        let b : CGFloat = CGFloat.random(in: 0...1)
        unitView.backgroundColor = UIColor(red : r,green: g,blue: b,alpha: 1)
        let url = URL(string: data.bookImage)
        posterImage.kf.setImage(with:url)
                
    }
    
}
