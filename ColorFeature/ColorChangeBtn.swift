//
//
//  Created by Romany GirGis, 2021.
//

import UIKit
//Color Data
var colorOption = ["DEFAULT","TRUE RED","MEDIUM CRIMSON","WISTERIA PURPLE","SKY COLOR","ULTRAMARINE COLOR","PICTON BLUE",
                   "INDIGO COLOR","NAVY BLUE COLOR","LIGHT BLUE COLOR","GREEN BAMBOO","SISKIN SPROUT YELLOW","JUNGLE GREEN",
                   "OCEAN GREEN","JAPANESE TRIANDRA GRASS","RIPE LEMON","CREAM CAN"]

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
        
        //Alert Height
        let alertH = NSLayoutConstraint(item:colorAlert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 400)
        
        //pickerView Implementatioon inside alert
        let colorPicker = UIPickerView(frame: CGRect( x: 0, y: 0, width: 0, height: 300))
        colorPicker.delegate = self
        colorPicker.dataSource =  self
        
        //alert SubViews adds
        colorAlert.view.addSubview(colorPicker)
        colorAlert.view.addConstraint(alertH)
        
        //Control Actions
        let colorChange = UIAlertAction(title: "Change", style: .default ){ _ in
            let colorSelected = colorOption[colorPicker.selectedRow(inComponent: 0)]
            //screen color options
            switch colorSelected{
            case "DEFAULT":
                self.view.backgroundColor = .white
                self.table.backgroundColor = .white
                break
                
            case "TRUE RED":
                let trueRed = UIColor(red: 0.56, green: 0.11, blue: 0.13, alpha: 1.00)
                self.view.backgroundColor = trueRed
                self.table.backgroundColor = trueRed
                break
                
            case "MEDIUM CRIMSON":
                let mediumCrimson = UIColor(red: 0.79, green: 0.22, blue: 0.34, alpha: 1.00)
                self.view.backgroundColor = mediumCrimson
                self.table.backgroundColor = mediumCrimson
                break
                
            case "WISTERIA PURPLE":
                let wisteriaPurple = UIColor(red: 0.53, green: 0.35, blue: 0.98, alpha: 1.00)
                self.view.backgroundColor = wisteriaPurple
                self.table.backgroundColor = wisteriaPurple
                break
                
            case "SKY COLOR":
                let skyColor = UIColor(red: 0.30, green: 0.56, blue: 0.67, alpha: 1.00)
                self.view.backgroundColor = skyColor
                self.table.backgroundColor = skyColor
                break
                
            case "ULTRAMARINE COLOR":
                let ultramarineColor = UIColor(red: 0.36, green: 0.55, blue: 0.68, alpha: 1.00)
                self.view.backgroundColor = ultramarineColor
                self.table.backgroundColor = ultramarineColor
                break
                
            case "PICTON BLUE":
                let pitconBlue = UIColor(red: 0.13, green: 0.65, blue: 0.94, alpha: 1.00)
                self.view.backgroundColor = pitconBlue
                self.table.backgroundColor = pitconBlue
                break
                
            case "INDIGO COLOR":
                let indigoColor = UIColor(red: 0.15, green: 0.26, blue: 0.28, alpha: 1.00)
                self.view.backgroundColor = indigoColor
                self.table.backgroundColor = indigoColor
                break
                
            case "NAVY BLUE COLOR":
                let navyblueColor = UIColor(red: 0.00, green: 0.19, blue: 0.44, alpha: 1.00)
                self.view.backgroundColor = navyblueColor
                self.table.backgroundColor = navyblueColor
                break
                
            case "LIGHT BLUE COLOR":
                let lightblueColor = UIColor(red: 0.28, green: 0.57, blue: 0.61, alpha: 1.00)
                self.view.backgroundColor = lightblueColor
                self.table.backgroundColor = lightblueColor
                break
                
            case "GREEN BAMBOO":
                let greenBamboo = UIColor(red: 0.00, green: 0.39, blue: 0.26, alpha: 1.00)
                self.view.backgroundColor = greenBamboo
                self.table.backgroundColor = greenBamboo
                break
                
            case "SISKIN SPROUT YELLOW":
                let siskinsproutYellow = UIColor(red: 0.48, green: 0.58, blue: 0.18, alpha: 1.00)
                self.view.backgroundColor = siskinsproutYellow
                self.table.backgroundColor = siskinsproutYellow
                break
                
            case "JUNGLE GREEN":
                let jungleGreen = UIColor(red: 0.15, green: 0.76, blue: 0.51, alpha: 1.00)
                self.view.backgroundColor = jungleGreen
                self.table.backgroundColor = jungleGreen
                break
                
            case "OCEAN GREEN":
                let oceanGreen = UIColor(red: 0.30, green: 0.69, blue: 0.49, alpha: 1.00)
                self.view.backgroundColor = oceanGreen
                self.table.backgroundColor = oceanGreen
                break
                
            case "JAPANESE TRIANDRA GRASS":
                let japanesetrindraGrass = UIColor(red: 0.89, green: 0.69, blue: 0.24, alpha: 1.00)
                self.view.backgroundColor = japanesetrindraGrass
                self.table.backgroundColor = japanesetrindraGrass
                break
                
            case "RIPE LEMON":
                let ripeLemon = UIColor(red: 0.97, green: 0.79, blue: 0.09, alpha: 1.00)
                self.view.backgroundColor = ripeLemon
                self.table.backgroundColor = ripeLemon
                break
                
            case "CREAM CAN":
                let creamCan = UIColor(red: 0.96, green: 0.84, blue: 0.43, alpha: 1.00)
                self.view.backgroundColor = creamCan
                self.table.backgroundColor = creamCan
                break
                
            default:
                print("error switch color!!!")
                break
            }
        }
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        colorAlert.addAction(colorChange)
        colorAlert.addAction(cancel)
        
        //Alert Pop UP
        self.present(colorAlert, animated: true ,completion: {colorPicker.frame.size.width = colorAlert.view.frame.size.width})
    }
}
