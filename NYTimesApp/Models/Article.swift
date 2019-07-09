//
//  Article.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import Foundation

struct Article: Codable {
    var title: String?
    var abstract: String?
    var publishedDate: String
    var url: String?
    var adxKeywords: String?
    var column: String?
    var section: String?
    var byline: String?
    var id: Int?
    var assetID: Int?
    var views: Int?
    var media: [Media]
    var uri: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case abstract
        case publishedDate = "published_date"
        case url
        case adxKeywords = "adx_keywords"
        case column
        case section
        case byline
        case id
        case assetID = "asset_id"
        case views
        case media
        case uri
    }
    
    func getThumbnailURLStr() -> String? {
        for metaData in media[0].mediaMetadata {
            if metaData.format == .standardThumbnail {
                return metaData.url
            }
        }
        return nil
    }
    
    func gatImagesURLs() -> [URL] {
        var urls: [URL] = []
        for metaData in media[0].mediaMetadata {
            if let url = URL(string: metaData.url ?? "") {
                urls.append(url)
            }
        }
        return urls
    }
}
