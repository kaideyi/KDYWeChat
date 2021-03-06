//
//  ChatCellDelegate.swift
//  KDYWeChat
//
//  Created by mac on 16/11/1.
//  Copyright © 2016年 kaideyi.com. All rights reserved.
//

import Foundation

/// 聊天各种Cell点击的代理
protocol ChatCellActionDelegate: class {
    /**
     *  点击头像
     */
    func didClickCellAavator(_ cell: ChatBaseTableCell)
    
    /**
     *  点击图片
     */
    func didClickCellWithImageView(_ cell: ChatBaseTableCell)
    
    /**
     *  点击位置
     */
    func didClickCellWithLocations(_ cell: ChatBaseTableCell)
    
    /**
     *  点击语音并播放
     */
    func didClickCellVoiceAndPlaying(_ cell: ChatAudioTableCell, isPlaying: Bool)
    
    /**
     *  点击视频并播放
     */
    func didClickCellVideoAndPlaying(_ cell: ChatBaseTableCell, isPlaying: Bool)
    
    /**
     *  发送失败，重发消息
     */
    func didClickCellAndReSendMessage(_ cell: ChatBaseTableCell)
}

