//
//  ChatEmotionView.swift
//  KDYWeChat
//
//  Created by mac on 16/9/19.
//  Copyright © 2016年 kaideyi.com. All rights reserved.
//

import UIKit
import Reusable

protocol ChatEmotionViewDelegate: class {
    
}

/// 聊天表情视图
class ChatEmotionView: UIView, NibReusable {
    weak var delegate: ChatEmotionViewDelegate?
}

