//
//  ViewController.swift
//  newsFeed
//
//  Created by Luan Silva on 05/06/17.
//  Copyright © 2017 Luan Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var tableView: UITableView!
    
    var articles : [ArticleObject]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchArticles();
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func fetchArticles(){
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=latest&apiKey=3363d72a9f204baa9b4c256775c88b28")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest){(data,response,error) in
            if error != nil{
                print(error)
                return
            }
            
            self.articles = [ArticleObject]();
            
            do{
                
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]]{
                    for articleFromJson in articlesFromJson{
                        let article = ArticleObject()
                        if let title = articleFromJson["title"] as? String,
                            let author = articleFromJson["author"] as? String,
                            let desc = articleFromJson["description"] as? String,
                            let url = articleFromJson["url"] as? String,
                            let image = articleFromJson["image"] as? String{
                            
                            article.author = author;
                            article.desc = desc
                            article.url = url
                            article.image = image
                            article.headline = title
                        }
                        self.articles?.append(article)
                        
                    }
                }
                
                DispatchQueue.main.async
                    {
                        self.tableView.reloadData()
                }
                
                
            }catch let error{
                print(error)
            }
        }
        
        task.resume()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        cell.title.text = self.articles?[indexPath.item].headline
        cell.desc.text = self.articles?[indexPath.item].desc
        cell.author.text = self.articles?[indexPath.item].author
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articles?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}

