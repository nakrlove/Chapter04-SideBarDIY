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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupView()  {
      
    }

    
    func getSideView() {
        
    }
    
    func setShadowEffect(shadow: Bool , offset: CGFloat)
    {
        
    }
    
    func openSideBar(_ complete: ( () -> Void)? ) {
    
    }
    
    func closeSideBar(_ complete: ( () -> Void)? ) {
    
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
