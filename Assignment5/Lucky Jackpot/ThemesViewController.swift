//
//  ThemesViewController.swift
//  Lucky Jackpot
//
//  Created by Milan Vadgama on 2023-05-04.
//  Student ID: Brendan Rodrigues 301119016, Milan Vadgama 301281833
//
// ViewController for theme selection

import UIKit

class ThemesViewController: UIViewController {
    var themeType = ThemeType.defaults
    
    @IBOutlet weak var defaultView:UIView!
    @IBOutlet weak var darkView:UIView!
    @IBOutlet weak var blueView:UIView!
    @IBOutlet weak var brownView:UIView!
    
    @IBOutlet weak var defaultCheckBox:UIImageView!
    @IBOutlet weak var darkCheckBox:UIImageView!
    @IBOutlet weak var blueCheckBox:UIImageView!
    @IBOutlet weak var brownCheckBox:UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setTheme()
    }
    
    
    func setTheme(){
        
        // saving pref from local
        let selectedValue = UserDefaults.standard.integer(forKey: "pref")
        themeType = themeType.getThemeType(selectedValue)
        
        
        self.view.backgroundColor = themeType.getBgColor()
        
        
        let selectedImage = UIImage(named: "selectedCircle")
        let unselectedImage = UIImage(named: "emptyCircle")
        
        
        defaultCheckBox.image = themeType == .defaults ? selectedImage : unselectedImage
        darkCheckBox.image = themeType == .dark ? selectedImage : unselectedImage
        blueCheckBox.image = themeType == .blue ? selectedImage : unselectedImage
        brownCheckBox.image = themeType == .brown ? selectedImage : unselectedImage
        
    }
    
    
    @IBAction func themeTapped(_ sender:UIButton){
        
        let selectedValue = sender.tag
        themeType = themeType.getThemeType(selectedValue)
        
        
        // saving pref in local
        UserDefaults.standard.set(selectedValue, forKey: "pref")
        
        
        // updating design
        setTheme()
        
    }


}
