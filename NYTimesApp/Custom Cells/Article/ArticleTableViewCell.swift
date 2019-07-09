//
//  ArticleTableViewCell.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    static var reusableIdentifier = "ArticleTableViewCell"
    static var nib: UINib {
        return UINib(nibName: "ArticleTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        thumbnailImageView.circular()
        thumbnailImageView.borderd()
    }
    
    func configure(with article: Article) {
        thumbnailImageView.kf.indicatorType = .activity
        if let thumbnailURL = URL(string: article.getThumbnailURLStr() ?? ""){
            thumbnailImageView.kf.setImage(with: thumbnailURL)
        }
        titleLabel.text = article.title
        abstractLabel.text = article.abstract
        dateLabel.text = article.publishedDate
    }
    
}
