//
//
//  Created by Romany GirGis, 2021.
//

import UIKit


//Alert Background Control
extension UIAlertController{
    func printBackgroundColor(_ color:UIColor?){
        let viewScene = self.view.subviews.first?.subviews.first!.subviews.first
        if  (viewScene != nil){
            viewScene?.backgroundColor = color
        }
    }
}

//alternative code
//colorAlert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = self.table.backgroundColor
