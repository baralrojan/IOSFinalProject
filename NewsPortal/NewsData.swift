//
//  NewsData.swift
//  NewsPortal
//
//  Created by user231854 on 3/25/23.
//

import Foundation

struct NewsData:Codable
{
    let status:String
    let articles:[ArticleData]
}
