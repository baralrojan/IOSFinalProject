//
//  ArticleData.swift
//  NewsPortal
//
//  Created by user231854 on 3/25/23.
//

import Foundation
struct ArticleData :Codable
{
    let author: String?
    let title: String
    let urlToImage:String?
    let content:String?
}
