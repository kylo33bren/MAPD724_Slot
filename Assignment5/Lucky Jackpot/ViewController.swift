//
//  AppDelegate.swift
//  Slot Machine_MAPD724
//
//  Created by Brendan Rodrigues on 2023-01-22.
//  Updated UI Layout by Milan Vadgama on 2023-03-30
//  Student ID: Brendan Rodrigues 301119016, Milan Vadgama 301281833
//
// Main Screen

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var viewCredits: UIView!
    @IBOutlet weak var viewBet: UIView!
    @IBOutlet weak var btnBet: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var btnSpin: UIButton!
    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var lblTotalCredit: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    var points = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNotificationAuthorization()
        
    }
    
    

    func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                // Handle the error
                print("Error requesting notification authorization: \(error.localizedDescription)")
            } else if granted {
                // User granted permission
                print("Notification authorization granted")
            } else {
                // User denied permission
                print("Notification authorization denied")
            }
        }
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
    
    
    @IBAction func resetPressed(_ sender: Any) {
        self.reset()
    }
    
    
    @IBAction func spinPressed(_ sender: Any) {
        self.spin()
    }
    
    @IBAction func betPressed(_ sender: Any) {
        if points >= 10 {
            points -= 10
            lblCredit.text = "\(points)"
        }
    }
    
    
}

//Slot machine functionality
extension ViewController {
    
    func spin() {
        
        let oldPoints = points
        let image1number = Int.random(in: 1...4)
        let image2number = Int.random(in: 1...4)
        let image3number = Int.random(in: 1...4)
        
        assignImages(number: image1number, image: image1)
        assignImages(number: image2number, image: image2)
        assignImages(number: image3number, image: image3)
        
        
        UIView.transition(with: image1, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: image2, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: image3, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
        
        
        points = points - 10
        
        
        if points < 0 {
            self.lblTotalCredit.text = "Bankrupt! $"
            self.lblCredit.text = "0"
        } else {
            self.lblTotalCredit.text = "Total Credits: $"
            self.lblCredit.text = "\(points)"
        }
        
        
        if image1number == image2number {
            points = points + 20
        } else if image1number == image3number {
            points = points + 20
        } else if image2number == image3number {
            points = points + 20
        } else if image1number == image2number && image2number == image3number {
            points = points + 30
        }
        
        if image1number == 4 && image2number == 4 && image3number == 4 {
            points = points + 10
        }
        
        if points % 10 == 0 && oldPoints != points { showNotification(points) }
        
        self.lblTotalCredit.text = "Total Credits: $"
        self.lblCredit.text = "\(points)"
    }
    
    
    func showLocalNotification(_ points:Int){
        
        
        
       
       
    }

    func showNotification(_ points:Int) {
        
        let center = UNUserNotificationCenter.current()
        
        // Define the notification content
        let content = UNMutableNotificationContent()
        content.title = "Congratulations!"
        content.body = "You have \(points) credits."
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "spin", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        // Schedule the notification
        center.add(request) { error in
            if let error = error {
                // Handle any errors
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                // Notification scheduled successfully
                print("Notification scheduled for current time")
            }
        }
    }

    
    
    
    func assignImages(number:Int, image:UIImageView) {
        switch number {
        case 1:
            image.image = UIImage(named: "apple")
        case 2:
            image.image = UIImage(named: "cherry")
        case 3:
            image.image = UIImage(named: "grape")
        case 4:
            image.image = UIImage(named: "jackpot")
        default:
            print("error")
        }
    }
    
    
    
    
    func reset() {
        self.points = 100
        self.lblTotalCredit.text = "Total Credits: $"
        self.lblCredit.text = "\(points)"
    }
}
