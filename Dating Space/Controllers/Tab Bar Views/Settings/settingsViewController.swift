//
//  settingsViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 26/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

//
//  aaViewController.swift
//  FirebaseApp
//
//  Created by Harry Jeffs on 15/3/19.
//  Copyright © 2019 Robert Canton. All rights reserved.
//

import UIKit
import SwiftIcons
import SwiftyStoreKit
import CyaneaOctopus
import SwiftKeychainWrapper
import Firebase

class settingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var tableViewMain : UITableView!
    let scrollView = UIScrollView()
    
    let pictureWidth:Int = 35
    var pictureHeight:Int = 35
    var languageArray = [String]()
    
    var items = [
        ["Language", "Premium", "Restore Purchases"],
        ["Notification Settings", "Notifications"],
        ["Terms & Conditions","Rate App", "Privacy Policy", "Help and Feedback", "Log Out"]
    ]
    let colours : [[UIColor]] = [
        [UIColor.flatSkyBlueColor() ,UIColor.flatRedColor(), UIColor.flatMagentaColor()],
        [UIColor.flatGreenColor(),UIColor.flatSkyBlueDarkColor(), UIColor.flatWatermelonColor()],
        [UIColor.init(hexString: "#3e6cb4"),UIColor.flatCoffeeColor(), UIColor.flatGrayColor(),UIColor.flatPowderBlueColor(), UIColor.flatYellowDarkColor()]]
    
    var tableViewHeight: CGFloat {
        tableViewMain.layoutIfNeeded()
        
        return tableViewMain.contentSize.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 800)
        self.tableViewMain = UITableView(frame: rect)
        self.tableViewMain.register(UITableViewCell.self, forCellReuseIdentifier: "cellThing")
        self.tableViewMain.delegate = self
        self.tableViewMain.dataSource = self
        self.tableViewMain.isScrollEnabled = false
        self.tableViewMain.tableFooterView = UIView()
    
        
       // self.tableViewMain.theme_backgroundColor = ThemeColorPicker(colors: UIColor.white, darkThemeBackgroundColor)
        
       // self.view.theme_backgroundColor = ThemeColorPicker(colors: UIColor.white, darkThemeBackgroundColor)
        
        scrollView.frame =  UIScreen.main.bounds
        
        
        self.tableViewMain.reloadData()
        
        view.addSubview(scrollView)
        scrollView.addSubview(tableViewMain)
        
        self.navigationItem.title = "Settings"
        
        self.navigationItem.backBarButtonItem?.title = "<"
        
        languageArray = [
            "Albanian","Arabic",
            "Basque","Belarusian","Bengali","Bulgarian","Burmese",
            "Catalan","Chinese (Simlified)","Chinese (Traditional)","Croatian","Czech",
            "Danish","Dutch",
            "English","English (Australian)","English (Great Britain)",
            "Farsi","Filipino","Finnish","French",
            "Galician","German","Greek","Gujarati",
            "Hebrew","Hindi","Hungarian",
            "Indonesian","Italian",
            "Japanese",
            "Kannada","Kazakh","Korean","Kyrgyz",
            "Latvian","Lithuanian",
            "Macedonian","Malayalam","Marathi",
            "Norwegian",
            "Polish","Portuguese","Portuguese (Brazil)","Portuguese (Portugal)","Punjabi",
            "Romanian","Russian",
            "Serbian","Slovak","Slovenian","Spanish","Swedish",
            "Tagalog","Tamil","Telugu","Thai","Turkish",
            "Ukrainian","Uzbek",
            "Vietnamese"
        ]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        var text = ""
        if(section == 0) {
            text = "Account"
        } else if (section == 1){
            text = "Preferences"
        }else {
            text = "Other"
        }
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100)
        
        let sectionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: tableView.frame.width - 50, height: 100))
        sectionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        //sectionLabel.theme_textColor = ThemeColorPicker(colors: UIColor.lightGray, UIColor.white)
        sectionLabel.text = text
        sectionLabel.sizeToFit()
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0, #available(iOS 13.0, *){
            return 3
        }else{
            return items[section].count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        _ = UIImage(icon: .googleMaterialDesign(.person), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white )
        let locationMarkerImage = UIImage(icon: .googleMaterialDesign(.locationOn), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white )
        let restoreImage = UIImage.init(icon: .googleMaterialDesign(.restore), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let starImage = UIImage.init(icon: .icofont(.crown), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let abouticonImage = UIImage.init(icon: .googleMaterialDesign(.info), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let darkStar = UIImage.init(icon: .icofont(.moon), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let privacyPolicyImage = UIImage.init(icon: .googleMaterialDesign(.description), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let supportImage = UIImage.init(icon: .googleMaterialDesign(.reportProblem), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let logoutImage = UIImage.init(icon: .googleMaterialDesign(.input), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let licences = UIImage.init(icon: .googleMaterialDesign(.subject), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let foodOptions = UIImage(icon: .icofont(.fileText), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white )
        let mapOptions = UIImage(icon: .googleMaterialDesign(.publicIcon), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white )
        let notificationImage = UIImage.init(icon: .googleMaterialDesign(.notificationsOff), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let notificationOn = UIImage.init(icon: .googleMaterialDesign(.notificationsActive), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let rateIcon = UIImage.init(icon: .googleMaterialDesign(.star), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        
        let images = [[locationMarkerImage, starImage,restoreImage, darkStar],[foodOptions,mapOptions, notificationImage ,notificationOn], [abouticonImage,rateIcon, privacyPolicyImage,licences, supportImage, logoutImage]]

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellThing")
        
       
            cell.backgroundColor = UIColor.white

    

        // Set the first row text label to the firstRowLabel data in our current array item
        print(indexPath.section, indexPath.row)
        cell.textLabel?.text = items[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 16)
       // cell.textLabel?.theme_textColor = ThemeColorPicker(colors: UIColor.black, UIColor.white)
        
        // Set the second row text label to the secondRowLabel data in our current array item
        cell.imageView?.image = images[indexPath.section][indexPath.row]
        cell.imageView?.backgroundColor = colours[indexPath.section][indexPath.row]
        cell.imageView?.layer.cornerRadius = 5
        cell.imageView?.layer.masksToBounds = true
        cell.selectionStyle = .default
        
        if (indexPath.row == 2 && indexPath.section == 1){
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(KeychainWrapper.standard.bool(forKey: "areNotificationsEnabled") ?? true, animated: true)
            switchView.tag = indexPath.row // for detect which row switch Changed
            switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            cell.accessoryView = switchView
            
            if (KeychainWrapper.standard.bool(forKey: "areNotificationsEnabled") ?? true){
                cell.imageView?.image = notificationOn
            }else{
                cell.imageView?.image = notificationImage
            }
        }else{
            cell.accessoryType = .disclosureIndicator
        }
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: tableViewHeight + 80)
        
        // Return our new cell for display
        return cell
    }
    @objc func switchChanged(_ sender : UISwitch!){
        print("table row switch Changed \(sender.tag)")
        print("The switch is \(sender.isOn ? "ON" : "OFF")")
        KeychainWrapper.standard.set(sender.isOn, forKey: "areNotificationsEnabled")
        
        let indexPath = NSIndexPath(row:sender.tag, section:1)
        let cell = tableViewMain.cellForRow(at: indexPath as IndexPath)!
        
        let notificationImage = UIImage.init(icon: .googleMaterialDesign(.notificationsOff), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        let notificationOn = UIImage.init(icon: .googleMaterialDesign(.notificationsActive), size: CGSize(width: pictureWidth, height: pictureHeight), textColor: .white)
        
        if (sender.isOn){
            cell.imageView?.image = notificationOn
            AppDelegate().locationManager.startMonitoringSignificantLocationChanges()
            AppDelegate().locationManager.startUpdatingLocation()
        }else{
            cell.imageView?.image = notificationImage
            AppDelegate().locationManager.stopMonitoringSignificantLocationChanges()
            AppDelegate().locationManager.stopUpdatingLocation()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        switch indexPath.section {
        case 0:
            switch indexPath.row{
            case 0: break
            case 1:
                print("Premium")
                //self.showPremium()
            case 2:
                print("Restore")
               // if loggedInUser.data.isPremium{
                   // self.showPopup(title: "It seems premium has already been purchased.")
                //}else{
//                    SwiftOverlays.showBlockingWaitOverlay()
//                    SwiftyStoreKit.restorePurchases(atomically: true) { results in
//                        SwiftOverlays.removeAllBlockingOverlays()
//                        if results.restoreFailedPurchases.count > 0 {
//                            print("Restore Failed: \(results.restoreFailedPurchases)")
//                        }else if results.restoredPurchases.count > 0 {
//                            print("Restore Success: \(results.restoredPurchases)")
//                        }else {
//                            print("Nothing to Restore")
//                        }
//                    }
               // }
            default:
                print("Error")
            }
        case 1:
            switch indexPath.row{
            case 0:
                print("Settings")
//                let homeView = mapOptionViewController()
//                self.navigationController?.pushViewController(homeView, animated: true)
            case 1:
                print("Notifications Settings")
//                let homeView = notificationSettingsViewController()
//                self.navigationController?.pushViewController(homeView, animated: true)
            case 2:
                print("Notifications Switch")
            default:
                print("Error")
            }
        case 2:
            switch indexPath.row{
            case 0:
                print("Terms and Conditions")
                //let newViewController = termsAndConditionsViewController()
                //self.navigationController?.pushViewController(newViewController, animated: true)
            case 1: break
                //SKStoreReviewController.requestReview()
            case 2:
                print("Privacy Policy")
               // let newViewController = PrivacyPolicyViewController()
                //self.navigationController?.pushViewController(newViewController, animated: true)
            case 3: break
            
            case 4:
                print("Support & FAQ")
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    self.dismiss(animated: false, completion: nil)
                } catch let signOutError as NSError {
                  print ("Error signing out: %@", signOutError)
                }
                
               // let webVC = SwiftModalWebVC(urlString: "https://topick.app/contact.php", theme: .dark, dismissButtonStyle: .arrow)
                
               // self.present(webVC, animated: true, completion: nil)
            default:
                print("Error")
            }
        default:
            print("Error")
        }
    }
}

