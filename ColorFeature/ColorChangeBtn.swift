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
    
    //Save chosen color
    override func viewDidAppear(_ animated: Bool) {
        if let savedColor = UserDefaults.standard.getColor(forKey: "myColor") {
            view.backgroundColor = savedColor
            table.backgroundColor = savedColor
            table.reloadData()
        }
        
    }
    
    //Change Color Buttton Operations
    @IBAction func colorBtn(_ sender:Any){
        let colorAlert = UIAlertController(title: " ", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        //Alert Height
        let alertH = NSLayoutConstraint(item:colorAlert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 400)
        
        //pickerView Implementatioon inside alert
        let colorPicker = UIPickerView(frame: CGRect( x: 0, y: 0, width: 0, height: 250))
        colorPicker.delegate = self
        colorPicker.dataSource =  self
        
        //alert SubViews adds
        colorAlert.view.addSubview(colorPicker)
        colorAlert.view.addConstraint(alertH)
        colorAlert.view.tintColor = .black
        //Background C
        colorAlert.printBackgroundColor(self.table.backgroundColor)
       
        //Control Actions
        let colorChange = UIAlertAction(title: "Change", style: .default ){ _ in
            let colorSelected = colorOption[colorPicker.selectedRow(inComponent: 0)]
            let colorKey = UserDefaults.standard
            //screen color options
            switch colorSelected{
            case "DEFAULT":
                colorKey.putColor(.white, forKey: "myColor")
                self.view.backgroundColor = .white
                self.table.backgroundColor = .white
                self.table.reloadData()
                break
                
            case "TRUE RED":
                let trueRed = UIColor(red: 0.56, green: 0.11, blue: 0.13, alpha: 1.00)
                colorKey.putColor(trueRed, forKey: "myColor")
                self.view.backgroundColor = trueRed
                self.table.backgroundColor = trueRed
                self.table.reloadData()
                break
                
            case "MEDIUM CRIMSON":
                let mediumCrimson = UIColor(red: 0.79, green: 0.22, blue: 0.34, alpha: 1.00)
                colorKey.putColor(mediumCrimson, forKey: "myColor")
                self.view.backgroundColor = mediumCrimson
                self.table.backgroundColor = mediumCrimson
                self.table.reloadData()
                break
                
            case "WISTERIA PURPLE":
                let wisteriaPurple = UIColor(red: 0.53, green: 0.35, blue: 0.98, alpha: 1.00)
                colorKey.putColor(wisteriaPurple, forKey: "myColor")
                self.view.backgroundColor = wisteriaPurple
                self.table.backgroundColor = wisteriaPurple
                self.table.reloadData()
                break
                
            case "SKY COLOR":
                let skyColor = UIColor(red: 0.30, green: 0.56, blue: 0.67, alpha: 1.00)
                colorKey.putColor(skyColor, forKey: "myColor")
                self.view.backgroundColor = skyColor
                self.table.backgroundColor = skyColor
                self.table.reloadData()
                break
                
            case "ULTRAMARINE COLOR":
                let ultramarineColor = UIColor(red: 0.36, green: 0.55, blue: 0.68, alpha: 1.00)
                colorKey.putColor(ultramarineColor, forKey: "myColor")
                self.view.backgroundColor = ultramarineColor
                self.table.backgroundColor = ultramarineColor
                self.table.reloadData()
                break
                
            case "PICTON BLUE":
                let pitconBlue = UIColor(red: 0.13, green: 0.65, blue: 0.94, alpha: 1.00)
                colorKey.putColor(pitconBlue, forKey: "myColor")
                self.view.backgroundColor = pitconBlue
                self.table.backgroundColor = pitconBlue
                self.table.reloadData()
                break
                
            case "INDIGO COLOR":
                let indigoColor = UIColor(red: 0.15, green: 0.26, blue: 0.28, alpha: 1.00)
                colorKey.putColor(indigoColor, forKey: "myColor")
                self.view.backgroundColor = indigoColor
                self.table.backgroundColor = indigoColor
                self.table.reloadData()
                break
                
            case "NAVY BLUE COLOR":
                let navyblueColor = UIColor(red: 0.00, green: 0.19, blue: 0.44, alpha: 1.00)
                colorKey.putColor(navyblueColor, forKey: "myColor")
                self.view.backgroundColor = navyblueColor
                self.table.backgroundColor = navyblueColor
                self.table.reloadData()
                break
                
            case "LIGHT BLUE COLOR":
                let lightblueColor = UIColor(red: 0.28, green: 0.57, blue: 0.61, alpha: 1.00)
                colorKey.putColor(lightblueColor, forKey: "myColor")
                self.view.backgroundColor = lightblueColor
                self.table.backgroundColor = lightblueColor
                self.table.reloadData()
                break
                
            case "GREEN BAMBOO":
                let greenBamboo = UIColor(red: 0.00, green: 0.39, blue: 0.26, alpha: 1.00)
                colorKey.putColor(greenBamboo, forKey: "myColor")
                self.view.backgroundColor = greenBamboo
                self.table.backgroundColor = greenBamboo
                self.table.reloadData()
                break
                
            case "SISKIN SPROUT YELLOW":
                let siskinsproutYellow = UIColor(red: 0.48, green: 0.58, blue: 0.18, alpha: 1.00)
                colorKey.putColor(siskinsproutYellow, forKey: "myColor")
                self.view.backgroundColor = siskinsproutYellow
                self.table.backgroundColor = siskinsproutYellow
                self.table.reloadData()
                break
                
            case "JUNGLE GREEN":
                let jungleGreen = UIColor(red: 0.15, green: 0.76, blue: 0.51, alpha: 1.00)
                colorKey.putColor(jungleGreen, forKey: "myColor")
                self.view.backgroundColor = jungleGreen
                self.table.backgroundColor = jungleGreen
                self.table.reloadData()
                break
                
            case "OCEAN GREEN":
                let oceanGreen = UIColor(red: 0.30, green: 0.69, blue: 0.49, alpha: 1.00)
                colorKey.putColor(oceanGreen, forKey: "myColor")
                self.view.backgroundColor = oceanGreen
                self.table.backgroundColor = oceanGreen
                self.table.reloadData()
                break
                
            case "JAPANESE TRIANDRA GRASS":
                let japanesetrindraGrass = UIColor(red: 0.89, green: 0.69, blue: 0.24, alpha: 1.00)
                colorKey.putColor(japanesetrindraGrass, forKey: "myColor")
                self.view.backgroundColor = japanesetrindraGrass
                self.table.backgroundColor = japanesetrindraGrass
                self.table.reloadData()
                break
                
            case "RIPE LEMON":
                let ripeLemon = UIColor(red: 0.97, green: 0.79, blue: 0.09, alpha: 1.00)
                colorKey.putColor(ripeLemon, forKey: "myColor")
                self.view.backgroundColor = ripeLemon
                self.table.backgroundColor = ripeLemon
                self.table.reloadData()
                break
                
            case "CREAM CAN":
                let creamCan = UIColor(red: 0.96, green: 0.84, blue: 0.43, alpha: 1.00)
                colorKey.putColor(creamCan, forKey: "myColor")
                self.view.backgroundColor = creamCan
                self.table.backgroundColor = creamCan
                self.table.reloadData()
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

