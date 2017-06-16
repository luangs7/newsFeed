//
//  MenuManager.swift
//  newsFeed
//
//  Created by Luan Silva on 16/06/17.
//  Copyright © 2017 Luan Silva. All rights reserved.
//

import UIKit

class MenuManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let blackView = UIView()
    let menuTableView = UITableView()
    let arrayOfSources = ["TechCrunch", "TechRadar"]
    
    
    public func openMenu(){
        if let window = UIApplication.shared.keyWindow{
            blackView.frame = window.frame
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissMenu)))
            
            let height : CGFloat = 100
            let y = window.frame.height - height
            
            menuTableView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            
            window.addSubview(blackView)
            
            UIView.animate(withDuration: 0.5, animations:{
                self.blackView.alpha = 1
                self.menuTableView.frame.origin.y = y
            })
            
        }
    }
    
    public func dismissMenu(){
        
        UIView.animate(withDuration: 0.5, animations:{
            self.blackView.alpha = 0
            
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfSources.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arrayOfSources[indexPath.item]
        
        return cell
    }

    
    override init() {
        super .init()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        menuTableView.isScrollEnabled = false
        menuTableView.bounces = false
        
        menuTableView.register(BaseViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        
    }

}
