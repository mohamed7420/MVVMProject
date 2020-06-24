//
//  ArticleViewModel.swift
//  MVVMProject
//
//  Created by Mohamed on 6/24/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import Foundation
import UIKit

struct ArticleViewModel{
    
    private let article: Article

    init(article: Article) {
        
        self.article  = article
    }
    
    var title: String{
        
        return article.title
    }
    
    var description: String{
        
        return article.description
    }
}


struct ArticleListViewModel {
    
    private let articles: [Article]
        
    init(articles: [Article]) {
        
        self.articles = articles
    }
    
    var numberOfSection: Int{
        
        return 1
    }
    
    var numberOfRowInSection: Int{
        
        return self.articles.count
    }
    
    func getArticle(At index: Int) -> ArticleViewModel{
        
        
        let selectedArticle = self.articles[index]
        
        return ArticleViewModel(article: selectedArticle)
    }
    
}
