//
//  CalculeViewController.swift
//  GWP
//
//  Created by Gаггу-Guииz  on 12/02/2019.
//  Copyright © 2019 COFELY_Technibook. All rights reserved.
//

import UIKit


class CalculeViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
    
    
    @IBOutlet var vuMenu: UIView!
    @IBOutlet var dropDown: UIPickerView!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var poids: UITextField!
    @IBOutlet weak var resultat: UITextField!
    @IBOutlet var gwp: UILabel!
    var gwpSelect = 99
    var resultatEqua = 0
    var poidsGaz = 99 ;
    
    @IBOutlet var texteReponse: UITextView!
    
    private var GWPArray: NSArray!
    private var momASHRAEValueArray: NSArray!
    
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
       self.dropDown.isHidden = true
        self.vuMenu.isHidden = true
        let dicRoot = NSDictionary.init(contentsOfFile: Bundle.main.path(forResource: "Feuil1", ofType: "plist")!)
      
        let titleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "Nom ASHRAE") as Any)
        momASHRAEValueArray = titleArrayFromDic.object(at: 0) as? NSArray
        
        
        let subTitleArrayFromDic: NSArray = NSArray.init(object: dicRoot!.object(forKey: "GWP") as Any)
        GWPArray = subTitleArrayFromDic.object(at: 0) as? NSArray
        
        
        // Calcule
        
       // resultat.inputView = (poids + gwp)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return momASHRAEValueArray.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        poids.resignFirstResponder()
        
        return momASHRAEValueArray? [row] as? String
        
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        gwp!.text = GWPArray? [row] as? String
        
        self.textBox.text = self.momASHRAEValueArray? [row] as? String
        self.dropDown.isHidden = true
         self.vuMenu.isHidden = true
  
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
          textBox.placeholder = ""
        self.textBox.isHidden = true
        self.vuMenu.isHidden = true
        if textField == self.textBox {
          
            
            self.dropDown.isHidden = false
             self.vuMenu.isHidden = false
            //if you dont want the users to se the keyboard type:
               self.textBox.isHidden = true
            textField.endEditing(true)
           
        }
         self.textBox.isHidden = false
        poids.resignFirstResponder()
    }
    
    @IBAction func calculeButton(_ sender: Any) {
        
        let textfieldInt: Int? = Int(poids!.text!)
        let textfield2Int: Int? = Int(gwp!.text!)
        
              poids.resignFirstResponder()
        //Calcule de Eq CO2
        let resultatEqCO = (textfieldInt! * textfield2Int!)/1000
        
        // ConvertText est la version string du résultat de on equation
        let convertText = String(resultatEqCO)
        
        // Resultat de mon équation en version String
        resultat!.text = convertText
        
       
        
        if resultatEqCO < 5 {
    
            texteReponse!.text = "Vous n'avez pas de un contrôle d'étanchéité à faire sur votre installation "
            
            
          
        }
        if resultatEqCO >= 5 && resultatEqCO < 50 {
            
            texteReponse!.text = "Vous devez réaliser un contrôle d'étanchéité 1 fois par ans, sur votre installations "
            
        }
        
     
        if resultatEqCO >= 50 && resultatEqCO < 500 {
           
            texteReponse!.text = "Vous devez réaliser un contrôle d'étanchéité 2 fois par ans, sur votre installations "
            
            
        }
        if  resultatEqCO >= 500  {
            
            texteReponse!.text = "Vous devez réaliser un contrôle d'étanchéité 3 fois par ans (trimestrielle) "
            
        }
        
      poids.resignFirstResponder()
    }
    
    
}
