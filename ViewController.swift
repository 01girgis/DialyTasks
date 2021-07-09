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
    
    //add button
    @IBAction func addBtn(_ sender: Any) {
            //Alert Box
            let alert   = UIAlertController(title: "new task", message: "enter your task", preferredStyle: .alert)
            alert.addTextField()
            
            //alret save process
            let saveBtn = UIAlertAction(title: "Save", style: .default , handler: {  (_) in
                
                //catch alert input data for creation entity
                let alertText = alert.textFields![0]
                
                //check if enter an empty task content
                if(alertText.text != ""){
                    let newTask = Tasks(context: self.content)
                    newTask.taskText = alertText.text
                }
                else{
                    print("empty alert")
                }
                
                //save data from alert box
                do{
                    try self.content.save()
                }
                catch {
                    print("error fetching alert box")
                }
                
                //update data
                self.fetchTask()
                
            })
            
            //finish alert save process
            alert.addAction(saveBtn)
            
            //cancel button
            let  cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelBtn)
            
            self.present(alert, animated: true, completion: nil)
            
            //for debugging
            print("addBtn tapped")
        }
    
}

