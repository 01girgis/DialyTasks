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


// MARK: -protocol and delegate implementation
extension ViewController : UITableViewDataSource , UITableViewDelegate{
   
    //Display data of array content on GUI
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataLoad.count
    }
   
    //assign data array to the every displayed cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        cell.textLabel?.text  = self.dataLoad[indexPath.row].taskText
        return cell
    }
    
    //editing data of the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //edit alert box
        let alertRetype = UIAlertController(title: "Edit Task", message: " ", preferredStyle: .alert)
        alertRetype.addTextField()
        
        //load the editied content data
        let editBtn = UIAlertAction(title: "Edit", style: .default , handler:{(action) in
            let alertText = alertRetype.textFields![0]
            
            self.dataLoad[indexPath.row].taskText = alertText.text
            
            //save editied content
            do{
                try self.content.save()
            }
            catch {
                print("error editing alert box")
            }
            
            //update  data
            self.fetchTask()
        })
        
        //finish editing alert process
        alertRetype.addAction(editBtn)
        self.present(alertRetype, animated: true, completion: nil)
        
        //for debugging
        print("editting")
    }
}
