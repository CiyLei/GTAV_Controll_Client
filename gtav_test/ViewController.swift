//
//  ViewController.swift
//  gtav_test
//
//  Created by ChenLei on 16/12/4.
//  Copyright © 2016年 ChenLei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var view1:UIView!
    var view2:UIView!
    var btn:UIButton!
    var fx:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view1 = UIView(frame: CGRect(x:20, y:self.view.frame.height - 170, width:150, height:150))
        let imageview:UIImageView = UIImageView(frame: CGRect(x:0, y:0, width:view1.frame.size.width, height:view1.frame.size.height))
        imageview.image = UIImage(named: "fx_w")
        view1.addSubview(imageview)
        self.view.addSubview(view1)
        
        view2 = UIView(frame: CGRect(x:40, y:40, width:70, height:70))
        let imageview1:UIImageView = UIImageView(frame: CGRect(x:0, y:0, width:view2.frame.size.width, height:view2.frame.size.height))
        imageview1.image = UIImage(named: "fx_n")
        view2.addSubview(imageview1)
        view1.addSubview(view2)
        
        btn = UIButton(frame: CGRect(x:self.view.frame.width - 20 - 120, y:self.view.frame.height - 150, width:110, height:110))
        btn.setBackgroundImage(UIImage(named: "main"), for: UIControlState.normal)
        btn.addTarget(self, action: Selector("mainTapper:"), for: .touchUpInside)
        self.view.addSubview(btn)
        
        //拖手势
        let panGesture = UIPanGestureRecognizer(target: self, action: Selector(("handlePanGesture:")))
        self.view2.addGestureRecognizer(panGesture)
        
        //配置IP
        let alert = UIAlertController(title: "连接配置", message: "请输入服务端的IP", preferredStyle: .alert)
        alert.addTextField { (textfiled:UITextField) -> Void in
            textfiled.placeholder = "请输入服务端的IP"
            textfiled.text = "192.168.1.110"
        }
        let okaction = UIAlertAction(title: "确定", style: .default) { (action) -> Void in
            let ipaddress = alert.textFields?.first?.text
            if let ip = ipaddress{
                SocketHelp.setIpaddress(ip: ip)
                SocketHelp.Get()
            }
        }
        alert.addAction(okaction)
        self.present(alert, animated: true){ () -> Void in
        }
    }
    
    
    //拖手势
    func handlePanGesture(sender: UIPanGestureRecognizer){
        //得到拖的过程中的xy坐标
        let translation : CGPoint = sender.translation(in: self.view2)
        /*正方形
        let max_x = (self.view1.frame.size.width - self.view2.frame.size.width) / 2
        let max_y = (self.view1.frame.size.height - self.view2.frame.size.height) / 2
        //平移图片CGAffineTransformMakeTranslation
        let trans_x = abs(translation.x) >= max_x ? (translation.x > 0 ? max_x : -max_x) : translation.x
        let trans_y = abs(translation.y) >= max_y ? (translation.y > 0 ? max_y : -max_y) : translation.y*/
        let r = (self.view1.frame.size.width - self.view2.frame.size.width) / 2
        let d = sqrt(translation.x * translation.x + translation.y * translation.y)
        let k = translation.y / translation.x
        
        if translation.y < 0 && (k >= 1.5 || k <= -1.5){
            sendfx(fx: 1)
        }else if translation.y < 0 && (k >= -1.5 && k <= -0.5){
            sendfx(fx: 2)
        }else if translation.x > 0 && (k >= -0.5 && k <= 0.5){
            sendfx(fx: 3)
        }else if translation.x > 0 && (k >= 0.5 && k <= 1.5){
            sendfx(fx: 4)
        }else if translation.y > 0 && (k >= 1.5 || k <= -1.5){
            sendfx(fx: 5)
        }else if translation.y > 0 && (k >= -1.5 && k <= -0.5){
            sendfx(fx: 6)
        }else if translation.x < 0 && (k >= -0.5 && k <= 0.5){
            sendfx(fx: 7)
        }else if translation.x < 0 && (k >= 0.5 && k <= 1.5){
            sendfx(fx: 8)
        }
        
        if d <= r {
            self.view2.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        }else{
            let trans_x = sqrt(r * r / (1 + k * k)) * (translation.x > 0 ? CGFloat(1.0) : CGFloat(-1.0))
            let trans_y = sqrt(r * r - (r * r / (1 + k * k))) * (translation.y > 0 ? CGFloat(1.0) : CGFloat(-1.0))
            self.view2.transform = CGAffineTransform(translationX: trans_x, y: trans_y)
        }
        
        if sender.state == UIGestureRecognizerState.ended{
            self.view2.transform = CGAffineTransform(translationX: 0, y: 0)
            sendfx(fx: 9)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MenuTapper(sender:AnyObject){
        let app = UIApplication.shared.delegate as! AppDelegate
        app.drawercontroller?.toggle(.left, animated: true, completion: nil)
    }
    
    func sendfx(fx:Int){
        if fx != self.fx{
            self.fx = fx
            SocketHelp.Get().send(info: "\(self.fx)")
        }
    }
    
    func mainTapper(sender:UIButton){
        SocketHelp.Get().send(info: "\(10)")
    }

}

