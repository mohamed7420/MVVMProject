//
//  NewsTableViewController.swift
//  MVVMProject
//
//  Created by Mohamed on 6/20/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var articlesVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        display()
    }
    
    func display(){
        
        guard let url = URL(string: Constants.url_string) else {return}
        
        WebServices(activityIndicator: activityIndicator).getArticles(url: url) { articles in
            
            if let articles = articles{
            
            self.articlesVM = ArticleListViewModel(articles: articles)
            
            }
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.articlesVM == nil ? 0 : self.articlesVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.articlesVM == nil ? 0 : self.articlesVM.numberOfRowInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        
        let article = self.articlesVM.getArticle(At: indexPath.row)
        
        cell.labelTitle.text = article.title
        
        cell.labelDescription.text = article.description
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
