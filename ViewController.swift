//
//  ViewController.swift
//  DailyTask
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    //access to managed objects in presistence conrtainer
    let content = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // array for data
    var dataLoad = [Tasks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
   
}

