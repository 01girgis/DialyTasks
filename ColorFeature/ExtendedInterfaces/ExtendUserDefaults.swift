//
//
//  Created by Romany GirGis, 2021.
//

import UIKit

extension UserDefaults{
    //color set
    func putColor(_ val:UIColor?,forKey key:String) {
        var putColorData:Data?
        if let myData = val {
            putColorData = try! NSKeyedArchiver.archivedData(withRootObject: myData, requiringSecureCoding: false)
        }
        set(putColorData, forKey: key)
    }
    
    //color load
    func getColor(forKey key:String) -> UIColor? {
        var getColorData:UIColor?
        if let myColor = data(forKey: key){
            getColorData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(myColor) as? UIColor
        }
        return getColorData
    }
}
