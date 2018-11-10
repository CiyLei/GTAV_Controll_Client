//
//  SocketHelp.swift
//  gtav_test
//
//  Created by ChenLei on 16/12/4.
//  Copyright © 2016年 ChenLei. All rights reserved.
//

import UIKit

class SocketHelp :GCDAsyncSocketDelegate{
    
    static var ipaddress = "192.168.1.110"
    let serverPort: UInt16 = 9112
    var clientSocket: GCDAsyncSocket!
    
    static var help:SocketHelp?
    
    static func Get() -> SocketHelp{
        if help == nil{
            help = SocketHelp()
        }
        return help!
    }
    
    init(){
        do {
            clientSocket = GCDAsyncSocket()
            clientSocket.delegate = self
            clientSocket.delegateQueue = DispatchQueue.global()
            try
                clientSocket.connect(toHost: SocketHelp.ipaddress, onPort: serverPort)
        }
        catch {
            print("error")
        }
    }
    
    static func setIpaddress(ip:String){
        SocketHelp.ipaddress = ip
    }
    
    @objc func socket(_ sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        
        print("与服务器连接成功！")
        
        clientSocket.readData(withTimeout: -1, tag: 0)
        
    }
    
    @objc func socketDidDisconnect(_ sock: GCDAsyncSocket!, withError err: Error!) {
        print("与服务器断开连接")
    }
    
    @objc func socket(_ sock: GCDAsyncSocket!, didRead data: Data!, withTag tag: Int) {
        /*
        // 1 获取客户的发来的数据 ，把 NSData 转 NSString
        let readClientDataString: NSString? = NSString(data: data, encoding: NSUTF8StringEncoding)
        print(readClientDataString!)
        
        // 2 主界面ui 显示数据
        dispatch_async(mainQueue, {
            
            let showStr: NSMutableString = NSMutableString()
            showStr.appendString(self.msgView.text)
            showStr.appendString(readClientDataString! as String)
            showStr.appendString("\n")
            self.msgView.text = showStr as String
            
        })
        
        // 3.处理请求，返回数据给客户端 ok
        let serviceStr: NSMutableString = NSMutableString()
        serviceStr.appendString("ok\n")
        clientSocket.writeData(serviceStr.dataUsingEncoding(NSUTF8StringEncoding), withTimeout: -1, tag: 0)
        
        // 4 每次读完数据后，都要调用一次监听数据的方法
        clientSocket.readDataWithTimeout(-1, tag: 0)
        */
    }
    
    func send(info:String){
        let serviceStr: NSMutableString = NSMutableString()
        serviceStr.append(info)
        serviceStr.append("\n")
        clientSocket.write(serviceStr.data(using: String.Encoding.utf8.rawValue), withTimeout: -1, tag: 0)
    }
}
