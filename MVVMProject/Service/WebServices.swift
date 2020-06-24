//
//  WebServices.swift
//  MVVMProject
//
//  Created by Mohamed on 6/20/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import Foundation
import UIKit

class WebServices{
    
    private var activityIndicator: UIActivityIndicatorView!
    
    init(activityIndicator: UIActivityIndicatorView) {
        
        self.activityIndicator = activityIndicator
        activityIndicator.startAnimating()
    }
    
    func getArticles(url: URL , completion: @escaping (_ articls: [Article]?)-> Void){
        
        let session = URLSession.shared
    
        session.dataTask(with: url) { (data, response, error) in
            
            if let _ = error{
                
                completion(nil)
                
            }else{
        
                if let data = data{
                    
                    let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                    
                    if let articleList = articleList{
                        
                        DispatchQueue.main.async {
                            
                            self.activityIndicator.stopAnimating()
                            
                            UIView.animate(withDuration: 0.4) {
                                
                                self.activityIndicator.alpha = 0.0
                            }
                        }
                        
                        completion(articleList.articles)
                        print(articleList)
                        
                    }
                    
                    
                }
            }
            
            
        }.resume()
        
        
    }
    
}
