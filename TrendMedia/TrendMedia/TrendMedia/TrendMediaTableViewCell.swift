//
//  TrendMediaTableViewCell.swift
//  TrendMedia
//
//  Created by useok on 2022/07/20.
//

import UIKit

class TrendMediaTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var PosterImage: UIImageView!
    @IBOutlet weak var ContentLabel: UILabel!
    
    func configureCell(data: String, rate:Double){
        TitleLabel.font = .boldSystemFont(ofSize: 15)
        TitleLabel.text = data
        DateLabel.text = "2222.22.22"
        ContentLabel.text = "\(rate)입니다."
        ContentLabel.numberOfLines = 0
    }
    func configureCell(data:Movie){
        TitleLabel.font = .boldSystemFont(ofSize: 15)
        TitleLabel.text = data.title
        DateLabel.text = "\(data.releaseDate) \(data.runtime)분 평점:\(data.rate), "
        ContentLabel.text = " \(data.overview)"
        ContentLabel.numberOfLines = 0
        
        PosterImage.image = UIImage(named: data.title)

    }
}
