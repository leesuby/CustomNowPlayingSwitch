//
//  ViewController.swift
//  CustomNowplayingSwitch
//
//  Created by LAP15335 on 02/12/2022.
//

import UIKit

struct NowPlayingSwitch{
    static var width : CGFloat = 36
    static var height : CGFloat = 20
    static var onTintColor : UIColor = UIColor(rgb: 0x9257DF) //dark purple
    static var offTintColor : UIColor = UIColor.lightGray
    static var cornerRadius : CGFloat = 1.0
    static var padding : CGFloat = 2
    static var thumbSize : CGSize = CGSize(width: 16, height: 16)
    static var thumbTintColor : UIColor = UIColor.white
    static var thumbCornerRadius : CGFloat = 1.0
    static var animationDuration : Double = 1.0
    static var defaultStatus : Bool = true
}

class ViewController: UIViewController {
    
    let customSwitch : CustomSwitch = {
        let customSwitch = CustomSwitch()
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        customSwitch.onTintColor = NowPlayingSwitch.onTintColor
        customSwitch.offTintColor = NowPlayingSwitch.offTintColor
        customSwitch.cornerRadius = NowPlayingSwitch.cornerRadius

        customSwitch.padding = NowPlayingSwitch.padding
        customSwitch.thumbCornerRadius = NowPlayingSwitch.thumbCornerRadius
        customSwitch.thumbTintColor = NowPlayingSwitch.thumbTintColor
        customSwitch.thumbSize = NowPlayingSwitch.thumbSize
        customSwitch.animationDuration = NowPlayingSwitch.animationDuration
        customSwitch.isOn = NowPlayingSwitch.defaultStatus
        
        return customSwitch
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        customSwitch.widthAnchor.constraint(equalToConstant: NowPlayingSwitch.width).isActive = true
        customSwitch.heightAnchor.constraint(equalToConstant: NowPlayingSwitch.height).isActive = true
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
