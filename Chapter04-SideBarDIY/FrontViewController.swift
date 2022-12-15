//
//  FrontViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by nakrlove on 2022/12/14.
//

import UIKit

class FrontViewController: UIViewController {

    var delegate: RevealViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        
        let btnSideBar = UIBarButtonItem(image: UIImage(named: "sidemenu.png"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(moveSide(_:)))
        
        self.navigationItem.leftBarButtonItem = btnSideBar
        
        let dragLeft = UIScreenEdgePanGestureRecognizer(
            target: self, action: #selector(moveSide))
        dragLeft.edges = .left
        self.view.addGestureRecognizer(dragLeft)
        
        let dragRight = UISwipeGestureRecognizer(
            target: self, action: #selector(moveSide))
        dragRight.direction = .left
        self.view.addGestureRecognizer(dragRight)
        // Do any additional setup after loading the view.
    }
    

    @objc func moveSide(_ sender: Any){
        
        if sender is UIScreenEdgePanGestureRecognizer {
            self.delegate?.openSideBar(nil)
        } else if sender is UISwipeGestureRecognizer {
            self.delegate?.closeSideBar(nil)
        }else if sender is UIBarButtonItem {
        
            if self.delegate?.isSideBarShowing == false {
                self.delegate?.openSideBar(nil)
            } else {
                self.delegate?.closeSideBar(nil)
            }
        }
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
