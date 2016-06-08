//  场景基类
//  GMLScene.swift
//  Chaos
//
//  Created by guominglong on 16/6/2.
//  Copyright © 2016年 guominglong. All rights reserved.
//

import Foundation
import SpriteKit
class GMLScene:SKScene {
    /**
     是否初始化成功
     */
    private(set) var isInited:Bool! = false;
    
    
    /**
     背景层最下层
     */
    private(set) var bgLayer:SKNode!;
    
    
    /**
     背景之上
     */
    private(set) var sceneBottomLayer:SKNode!;
    
    
    /**
     sceneBottomLayer之上，用于显示monster
     */
    private(set) var contextContainerLayer:SKNode!;
    
    /**
     contextContainerLayer之上，用于显示空中的特效以及在monster上的东西
     */
    private(set) var sceneTopLayer:SKNode!;
    
    /**
     sceneTopLayer之上，最上层，用于显示一些置顶信息,诸如：暂停，音量控制面板。
     */
    private(set) var uppermostLayer:SKNode!;
    
    
    /**
     场景名称
     */
    var sceneName:String! = "";
    
    /**
     初始化函数
     */
    func ginit()
    {
        isInited = true;
        self.scaleMode = .ResizeFill;
        bgLayer = createContainerNode(0);
        sceneBottomLayer = createContainerNode(1);
        contextContainerLayer = createContainerNode(2);
        sceneTopLayer = createContainerNode(3);
        uppermostLayer = createContainerNode(10000);
        self.addChild(bgLayer);
        self.addChild(sceneBottomLayer);
        self.addChild(contextContainerLayer);
        self.addChild(sceneTopLayer);
        self.addChild(uppermostLayer);
    }
    
    
    private func createContainerNode(zp:CGFloat)-> SKNode
    {
        let node = SKNode();
        node.zPosition = zp;
        node.xScale = autoScreen(1);
        node.yScale = autoScreen(1);
        return node;
    }
    
    /**
     尺寸更改后，自适应
     */
    func gresize(currentSize:CGSize)
    {
    
    }
    
    override func didMoveToView(view: SKView) {
        if(!isInited)
        {
            ginit();
            gresize(self.frame.size);
        }
    }
    
    override func didChangeSize(oldSize: CGSize) {
        if(isInited == true)
        {
            gresize(self.frame.size);
        }
    }
}