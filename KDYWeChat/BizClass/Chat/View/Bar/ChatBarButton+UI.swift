//
//  ChatBarButton+UI.swift
//  KDYWeChat
//
//  Created by kaideyi on 16/9/22.
//  Copyright © 2016年 kaideyi.com. All rights reserved.
//

import UIKit

// MARK: - 按钮状态的改变
extension UIButton {
    // 控制语音按钮切换成键盘图标
    func voiceButtonChangeToKeyboardUI(_ showKeyboard: Bool) {
        if showKeyboard {
            self.setImage(KDYAsset.Chat_Keyboard_Normal.image, for: UIControlState())
            self.setImage(KDYAsset.Chat_Keyboard_Select.image, for: .highlighted)
            
        } else {
            self.setImage(KDYAsset.Chat_Voice_Normal.image, for: UIControlState())
            self.setImage(KDYAsset.Chat_Voice_Select.image, for: .highlighted)
        }
    }
    
    // 控制表情按钮切换成键盘图标
    func emotionButtonChangeToKeyboardUI(_ showKeyboard: Bool) {
        if showKeyboard {
            self.setImage(KDYAsset.Chat_Keyboard_Normal.image, for: UIControlState())
            self.setImage(KDYAsset.Chat_Keyboard_Select.image, for: .highlighted)
            
        } else {
            self.setImage(KDYAsset.Chat_Emotion_Normal.image, for: UIControlState())
            self.setImage(KDYAsset.Chat_Emotion_Select.image, for: .highlighted)
        }
    }
    
    // 控制录音按钮的UI
    func replaceRecordButtonUI(_ isRecording: Bool) {
        if isRecording {
            self.setBackgroundImage(UIImage.imageWithColor(KDYColor.RecordBgNormal.color), for: .normal)
            self.setBackgroundImage(UIImage.imageWithColor(KDYColor.RecordBgSelect.color), for: .highlighted)
            
        } else {
            self.setBackgroundImage(UIImage.imageWithColor(KDYColor.RecordBgSelect.color), for: .normal)
            self.setBackgroundImage(UIImage.imageWithColor(KDYColor.RecordBgNormal.color), for: .highlighted)
        }
    }
}

