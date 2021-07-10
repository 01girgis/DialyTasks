//
//
//  Created by Romany GirGis, 2021.

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
        //table loading
        table.delegate = self
        table.dataSource = self
        // fetching data
        fetchTask()
    }
    
    //fecthing data from core data
    func fetchTask() {
        
        //try! content.fetch(Tasks.fetchRequest()) or error check
        do {
            
            self.dataLoad = try content.fetch(Tasks.fetchRequest())
            //reload data to main thread
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
        catch{
            //error check
            print("error fething data")
        }
    }
    
   
    
}


