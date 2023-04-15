//
//  AboutViewController.swift
//  Lucky Jackpot
//
//  Created by Brendan Rodrigues on 2023-04-04.
//  Student ID: Brendan Rodrigues 301119016, Milan Vadgama 301281833
//
//  ViewController for About Page
//

import UIKit

class AboutViewController: UIViewController {

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
    

   

}
