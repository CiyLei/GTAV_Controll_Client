//
//  MenuController.swift
//  gtav_test
//
//  Created by ChenLei on 16/12/4.
//  Copyright © 2016年 ChenLei. All rights reserved.
//

import UIKit

class MenuController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    
    var gtav_mj:GTAV_MJ!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gtav_mj = GTAV_MJ();
        
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        //注册cell（应该类似于反射）
        table.register(CellController.classForCoder(), forCellReuseIdentifier: CellController.cellID())
        table.dataSource = self
        table.delegate = self
        
        self.view.addSubview(table)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return gtav_mj.MJS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: CellController.cellID(), for: indexPath as IndexPath) as! CellController
        cell.label_text.text = gtav_mj.MJS[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let app = UIApplication.shared.delegate as! AppDelegate
        app.drawercontroller?.toggle(.left, animated: true, completion: nil)
        print(gtav_mj.MJS[indexPath.row].mj)
        SocketHelp.Get().send(info: gtav_mj.MJS[indexPath.row].mj)
    }
    
}
