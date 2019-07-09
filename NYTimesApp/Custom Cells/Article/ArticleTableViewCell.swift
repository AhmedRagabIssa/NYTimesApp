//
//  ArticleTableViewCell.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import UIKit

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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with article: Article) {
        // TODO: - map the thumbnail using alamofire
        titleLabel.text = article.title
        abstractLabel.text = article.abstract
        dateLabel.text = article.publishedDate
    }
    
}
