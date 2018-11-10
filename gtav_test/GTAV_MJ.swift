//
//  GTAV_MJ.swift
//  gtav_test
//
//  Created by ChenLei on 16/12/4.
//  Copyright © 2016年 ChenLei. All rights reserved.
//
import UIKit

class GTAV_MJ {
    
    var MJS = Array<MJ>()
    let mj_str:NSString = """
        醉酒模式    LIQUOR    1-999-547-861\r
        爆炸+近战攻击    HOTHANDS    1-999-4684-2637\r
        快速奔跑    CATCHME    1-999-228-8463\r
        燃烧+武器弹药    INCENDIARY    1-999-462-363-4279\r
        无敌5分钟    PAINKILLER    1-999-724-654-5537\r
        加满血与护甲    TURTLE    1-999-887-853\r
        提升通缉等级    FUGITIVE    1-999-3844-8483\r
        技能冷却完成    POWERUP    1-999-769-3787\r
        从空中跳下    SKYFALL    1-999-759-3255\r
        瞄准时慢动作(输入一次减慢1X，最多4次，第5次取消)    DEADEYE    1-999-332-3393\r
        获得降落伞(装备后按 X 键使用)    SKYDIVE    1-999-759-3483\r
        改变天气(按 阳光、晴天、多云、雾、阴天、雨天、雷雨、下雪)    MAKEITRAIN    1-999-625-348-7246\r
        月球引力(激活后进入载具可以体验，跳跃后按 o(字母) 键漂浮)    FLOATER    1-999-356-2837\r
        车胎打滑(漂移)    SNOWDAY    1-999-766-9329\r
        慢动作(输入一次减慢1X，最多3次，第4次取消)    SLOWMO    1-999-756-966\r
        获得BMX(小轮车自行车)    BANDIT    1-999-226-348\r
        获得秃鹰直升机(小型武装直升机)    BUZZOFF    1-999-289-9633\r
        获得彗星跑车(一种双门跑车)    COMET    1-999-266-38\r
        获得豪华轿车    VINEWOOD    1-999-846-39663\r
        获得PCJ-600(摩托)    ROCKET    1-999-762-538\r
        获得GT跑车(另一种双门跑车)    RAPIDGT    1-999-727-4348\r
        获得桑切斯(高赛摩托)    OFFROAD    1-999-633-7623\r
        获得特技飞机    BARNSTORM    1-999-2276-78676\r
        获得垃圾车    TRASHED    1-999-872-433
    """
    
    init(){
        fx()
    }
    
    func fx(){
        let mjs_s = mj_str.components(separatedBy: "\r");
        for index in 0...mjs_s.count - 1{
            let mj_s = mjs_s[index].components(separatedBy: "    ");
            let mj = MJ(name: mj_s[0], mj: mj_s[1])
            MJS.append(mj)
        }
    }
}
class MJ{
    let name:String
    let mj:String
    init(name:String,mj:String){
        self.name = name
        self.mj = mj
    }
}
