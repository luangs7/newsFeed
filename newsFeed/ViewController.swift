//
//  ViewController.swift
//  newsFeed
//
//  Created by Luan Silva on 05/06/17.
//  Copyright © 2017 Luan Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell",for:indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
}

