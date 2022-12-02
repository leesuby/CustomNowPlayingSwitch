//
//  ViewController.swift
//  CustomNowplayingSwitch
//
//  Created by LAP15335 on 02/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let customSwitch : CustomSwitch = {
        let customSwitch = CustomSwitch()
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        customSwitch.onTintColor = UIColor(rgb: 0x9257DF)
        customSwitch.offTintColor = UIColor.lightGray
        customSwitch.cornerRadius = 1.0

        customSwitch.padding = 2
        customSwitch.thumbCornerRadius = 1.0
        customSwitch.thumbTintColor = UIColor.white
        customSwitch.thumbSize = CGSize(width: 16, height: 16)
        customSwitch.animationDuration = 1.0
        customSwitch.isOn = true
        
        return customSwitch
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
        initConstraint()
    }

    func initView(){
        view.backgroundColor = .white
        
        customSwitch.delegate = self
    }
    
    func initConstraint(){
        view.addSubview(customSwitch)
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        customSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        customSwitch.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        customSwitch.widthAnchor.constraint(equalToConstant: 36).isActive = true
        customSwitch.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

}

extension ViewController : CustomSwitchDelegate{
    func customSwitch(touchUpChangeOnOffStatus status: Bool) {
        print(status)
    }
    
}

//Using to change hex code to rgb
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
