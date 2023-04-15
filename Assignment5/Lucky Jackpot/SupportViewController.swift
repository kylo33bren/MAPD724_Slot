//
//  SupportViewController.swift
//  Lucky Jackpot
//
//  Created by Brendan Rodrigues on 2023-03-04.
//  Student ID: Brendan Rodrigues 301119016, Milan Vadgama 301281833
//
//

import UIKit

class SupportViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDesing()
    }
    
    func setDesing(){
        var themeType = ThemeType.defaults
        let selectedValue = UserDefaults.standard.integer(forKey: "pref")
        themeType = themeType.getThemeType(selectedValue)
        self.view.backgroundColor = themeType.getBgColor()
    }
    
    
    @IBAction func openDailPad(_ sender:UIButton){
        
        let number = "12345678"
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
        
        
    }
    
    @IBAction func openMailBox(_ sender:UIButton){
        let email = "test@gmail.com"
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
        
        
        
    }


}
