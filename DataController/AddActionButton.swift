//
//
//  Created by Romany GirGis, 2021.

import UIKit
extension ViewController{
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
