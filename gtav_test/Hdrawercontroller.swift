//
//  Hdrawercontroller.swift
//  gtav_test
//
//  Created by ChenLei on 16/12/4.
//  Copyright © 2016年 ChenLei. All rights reserved.
//

import UIKit
import MMDrawerController

class Hdrawercontroller: MMDrawerController {
    
    override init!(center centerViewController: UIViewController!, leftDrawerViewController: UIViewController!) {
        super.init(center: centerViewController, leftDrawerViewController: leftDrawerViewController)
    }

    override init!(center centerViewController: UIViewController!, leftDrawerViewController: UIViewController!, rightDrawerViewController: UIViewController!) {
        super.init(center: centerViewController, leftDrawerViewController: leftDrawerViewController, rightDrawerViewController: rightDrawerViewController)
    }

    override init!(center centerViewController: UIViewController!, rightDrawerViewController: UIViewController!) {
        super.init(center: centerViewController, rightDrawerViewController: rightDrawerViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    //支持的方向
//    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        return UIInterfaceOrientationMask.landscapeLeft
//    }
//    
//    //支持旋转
//    override func shouldAutorotate() -> Bool {
//        return true
//    }
}
