//
//  RevealViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by nakrlove on 2022/12/14.
//

import UIKit

class RevealViewController: UIViewController {

    var contentVC: UIViewController?
    var sideVC: UIViewController?
    
    var isSideBarShowing = false
    let SLIDE_TIME = 0.3
    let SIDERBAR_WIDTH: CGFloat = 260
    
    var delegate: FrontViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
//        delegate = self
        // Do any additional setup after loading the view.
    }
    
    func setupView()  {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController{
            
            let frontVC = vc.viewControllers[0] as? FrontViewController
            frontVC?.delegate = self
            
            self.contentVC = vc
            self.addChild(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
    }

    
    func getSideView() {
        
        guard self.sideVC == nil else {
            return
        }
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") else {
            return
        }
        
        self.sideVC = vc
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
        self.view.bringSubviewToFront((self.contentVC?.view)!)
        
        
    }
    
    func setShadowEffect(shadow: Bool , offset: CGFloat)
    {
        if( shadow == true ){
            self.contentVC?.view.layer.masksToBounds = false
            self.contentVC?.view.layer.cornerRadius = 10
            self.contentVC?.view.layer.shadowOpacity = 0.8
            self.contentVC?.view.layer.shadowColor = UIColor.black.cgColor
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        } else {
            self.contentVC?.view.layer.cornerRadius = 0.0
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    func openSideBar(_ complete: (() -> Void)? ) {
        self.getSideView()
        self.setShadowEffect(shadow: true, offset: -2)
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME)
                       , delay: TimeInterval(0)
                       , options: options
                       , animations: {
                            self.contentVC?.view.frame = CGRect(x: self.SIDERBAR_WIDTH, y: 0,width: self.view.frame.width, height: self.view.frame.height)
//
                        }, completion: {
                            if $0 == true {
                                self.isSideBarShowing = true
                                complete?()
                            }
                        }
        )

    }
    
    func closeSideBar(_ complete: ( () -> Void)? ) {
       
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME)
                       , delay: TimeInterval(0)
                       , options: options
                       , animations: {
                            self.contentVC?.view.frame = CGRect(x:0, y: 0,width: self.view.frame.width, height: self.view.frame.height)
            
                        }, completion: {
                            if $0 == true {
                                self.sideVC?.view.removeFromSuperview()
                                self.sideVC = nil
                                
                                self.isSideBarShowing = false
                                self.setShadowEffect(shadow: false, offset: 0)
                                complete?()
                            }
                        }
        )

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
