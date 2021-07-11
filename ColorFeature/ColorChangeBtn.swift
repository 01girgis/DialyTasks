//
//
//  Created by Romany GirGis, 2021.
//

import UIKit

extension ViewController{
   
    
    //Change Color Buttton Operations
    @IBAction func colorBtn(_ sender:Any){
        let colorAlert = UIAlertController(title: " ", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)

        //Control Actions
        let colorChange = UIAlertAction(title: "Change", style: .default ){ _ in }
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        colorAlert.addAction(colorChange)
        colorAlert.addAction(cancel)
        
        //Alert Pop UP
        self.present(colorAlert, animated: true ,completion: nil)
    }
}
