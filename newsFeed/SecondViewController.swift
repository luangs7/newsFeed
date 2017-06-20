//
//  SecondViewController.swift
//  newsFeed
//
//  Created by Luan Silva on 19/06/17.
//  Copyright © 2017 Luan Silva. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var userDefaults = UserDefaults.standard

        if let data = userDefaults.object(forKey: "appointment") as? NSData {
            let app = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! Appointment
            let myDoubleString = String(describing: app.otherCost as! Double)

            label.text = myDoubleString
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
