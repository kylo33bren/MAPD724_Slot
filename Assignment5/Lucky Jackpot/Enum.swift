//
//  Enum.swift
//  Lucky Jackpot
//
//  Created by Brendan Rodrigues on 2023-04-08.
//  Student ID: Brendan Rodrigues 301119016, Milan Vadgama 301281833
//
// 
//

import Foundation
import UIKit

enum ThemeType{
    case defaults
    case dark
    case blue
    case brown
    
    
    
    func getThemeType(_ selectedValue:Int)->ThemeType{
        
        if selectedValue == 0{
            return .defaults
        }else if selectedValue == 1{
            return .dark
        }else if selectedValue == 2{
            return .blue
        }else if selectedValue == 3{
            return .brown
        }
        
        return .defaults
        
    }
    
    func getBgColor()->UIColor{
        switch self {
        case .defaults:
            return UIColor.defaultColor
        case .dark:
            return UIColor.blackColor
        case .blue:
            return UIColor.blueColor
        case .brown:
            return UIColor.brownColor
        }
        
    }
    
    
}
