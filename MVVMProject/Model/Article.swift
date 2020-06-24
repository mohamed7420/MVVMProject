//
//  Article.swift
//  MVVMProject
//
//  Created by Mohamed on 6/20/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import Foundation

struct Article: Decodable{
    
    let title: String
    
    let description: String
}

struct ArticleList: Decodable{
    
    let articles: [Article]
}
