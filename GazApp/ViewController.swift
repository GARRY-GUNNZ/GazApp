//
//  UIViewController.swift
//  GWP
//
//  Created by TechniApp on 11/02/2019.
//  Copyright © 2019 COFELY_Technibook. All rights reserved.
//

import UIKit

class ViewController: UITableViewController , UIPickerViewDataSource,UIPickerViewDelegate {
   
    
   
    @IBOutlet var tri: UILabel!
    @IBOutlet var semestrie: UILabel!
    @IBOutlet var gwp: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var nom: UILabel!
    @IBOutlet var annu: UILabel!
    
    //@IBOutlet var table: UITableView!
    
    @IBOutlet var keyPickerView: UILabel!
    @IBOutlet var pickerGaz: UIPickerView!
    private var momASHRAEValueArray: NSArray!
    private var nomCommercialPArray: NSArray!
    private var GWPArray: NSArray!
    private var TypeArray: NSArray!
    private var annuelleArray: NSArray!
    private var semestrielleArray: NSArray!
    private var trimestrielleArray: NSArray!
    
    private var indexSelect : NSInteger = 0
    
    
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get dicRoot
        
        let dicRoot = NSDictionary.init(contentsOfFile: Bundle.main.path(forResource: "Feuil1", ofType: "plist")!)
        
        let titleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "Nom ASHRAE") as Any)
        momASHRAEValueArray = titleArrayFromDic.object(at: 0) as? NSArray
        
        let nomCommercialPArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "Nom commercial") as Any)
       nomCommercialPArray = nomCommercialPArrayFromDic.object(at: 0) as? NSArray
        
        let subTitleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "GWP") as Any)
        GWPArray = subTitleArrayFromDic.object(at: 0) as? NSArray
        
        
        let TypeArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "Type") as Any)
        TypeArray = TypeArrayFromDic.object(at: 0) as? NSArray
        
        
        let annuelleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "annuelle") as Any)
        annuelleArray = annuelleArrayFromDic.object(at: 0) as? NSArray
        
        
        let semestrielleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "semestrielle") as Any)
        semestrielleArray = semestrielleArrayFromDic.object(at: 0) as? NSArray
        
        
        let trimestrielleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "trimestrielle") as Any)
        trimestrielleArray = trimestrielleArrayFromDic.object(at: 0) as? NSArray
        
        
        
        
       // for count in 0..<momASHRAEValueArray.count
        do {
            //print(momASHRAEValueArray[count])
          //  print(GWPArray[count])
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return momASHRAEValueArray.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      
        return momASHRAEValueArray? [row] as? String
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
      
        
     
         keyPickerView.text = momASHRAEValueArray? [row] as? String
        
        nom.text = nomCommercialPArray? [row] as? String
        gwp.text = GWPArray? [row] as? String
        type.text = TypeArray? [row] as? String
        annu.text = annuelleArray? [row] as? String
        semestrie.text = semestrielleArray? [row] as? String
        tri.text = trimestrielleArray? [row] as? String
        
        
    }

    
    
    
    
}


/*
 
 // MARK: DataSource - Tableview
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return momASHRAEValueArray.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
 cell.textLabel?.text = momASHRAEValueArray[indexPath.row] as? String
 cell.detailTextLabel?.text = GWPArray[indexPath.row] as? String
 return cell
 }
 
 
 
 //   MARK: DataSource - Picker
 
 
 public func numberOfComponents(in pickerView: UIPickerView) -> Int {
 return 1
 }
 */
