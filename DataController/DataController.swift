//
//
//  Created by Romany GirGis, 2021.


import UIKit
//protocol and delegate implementation
extension ViewController : UITableViewDataSource , UITableViewDelegate{
    
    //Display data of array content on GUI
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataLoad.count
    }
    
    //assign data array to the every displayed cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        cell.textLabel?.text  = self.dataLoad[indexPath.row].taskText
        cell.backgroundColor = self.table.backgroundColor
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
    
    //swipe action for deleting
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //remove cell action
        let remove  = UIContextualAction(style: .destructive, title: "Remove"){ (remove,view,completionHandler) in
            let removeTask = self.dataLoad[indexPath.row]
            self.content.delete(removeTask)
            
            //save Core Data
            do{
                try self.content.save()
            }
            catch {
                print("delete error")
            }
            
            //update data
            self.fetchTask()
            
            //debug
            print("removed")
            
        }
        return UISwipeActionsConfiguration(actions: [remove])
    }
}
