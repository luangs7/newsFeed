//
//  ViewController.swift
//  newsFeed
//
//  Created by Luan Silva on 05/06/17.
//  Copyright © 2017 Luan Silva. All rights reserved.
//

import UIKit

import SDWebImage


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
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=3363d72a9f204baa9b4c256775c88b28")!)
        
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
                            let image = articleFromJson["urlToImage"] as? String{
                            
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
        
        let indexNumber = indexPath.item as? Int
        
        cell.title.text = self.articles?[indexPath.row].headline
        cell.desc.text = self.articles?[indexPath.row].desc
        cell.author.text = self.articles?[indexPath.row].author
        cell.imgView.sd_setImage(with: URL(string: (self.articles?[indexPath.row].image)! ))
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebViewController
        
        webVC.url = self.articles?[indexPath.row].url
        
        self.present(webVC, animated: true, completion: nil)
    }
    
    
    let menuManager = MenuManager()
    @IBAction func menubtn(_ sender: Any) {
        menuManager.openMenu()
    }
    
}

