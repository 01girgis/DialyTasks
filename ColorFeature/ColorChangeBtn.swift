//
//
//  Created by Romany GirGis, 2021.
//

import UIKit
//Color Data
var colorOption = ["TRUE RED","MEDIUM CRIMSON","WISTERIA PURPLE","SKY COLOR","ULTRAMARINE COLOR","PICTON BLUE",
                   "INDIGO COLOR","NAVY BLUE COLOR","LIGHT BLUE COLOR","GREEN BAMBOO","SISKIN SPROUT YELLOW",
                   "JUNGLE GREEN","OCEAN GREEN","JAPANESE TRIANDRA GRASS","RIPE LEMON","CREAM CAN"]

extension ViewController: UIPickerViewDelegate ,UIPickerViewDataSource{
    //PickerView Initialize
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorOption[row]
    }
    
    //Change Color Buttton Operations
    @IBAction func colorBtn(_ sender:Any){
        let colorAlert = UIAlertController(title: " ", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)
        let alertH = NSLayoutConstraint(item:colorAlert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 400)
        
        //pickerView Implementatioon inside alert
        let colorPicker = UIPickerView(frame: CGRect( x: 0, y: 0, width: 0, height: 300))
        colorPicker.delegate = self
        colorPicker.dataSource =  self
        
        //alert SubViews adds
        colorAlert.view.addSubview(colorPicker)
        colorAlert.view.addConstraint(alertH)
        
        //Control Actions
        let colorChange = UIAlertAction(title: "Change", style: .default ){ _ in }
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        colorAlert.addAction(colorChange)
        colorAlert.addAction(cancel)
        
        //Alert Pop UP
        self.present(colorAlert, animated: true ,completion: {colorPicker.frame.size.width = colorAlert.view.frame.size.width})
    }
}
