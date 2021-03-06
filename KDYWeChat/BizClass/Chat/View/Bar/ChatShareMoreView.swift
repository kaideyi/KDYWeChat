//
//  ChatShareMoreView.swift
//  KDYWeChat
//
//  Created by mac on 16/9/19.
//  Copyright © 2016年 kaideyi.com. All rights reserved.
//

import UIKit
import Reusable

protocol ChatShareMoreViewDelegate: class {
    /// 点击照片
    func didClickPhotoItemAction(_ photoCounts: Int)

    /// 点击拍照
    func didClickCamaraItemAction()

    /// 点击语音聊天
    func didClickAudioChatItemAction()

    /// 点击视频聊天
    func didClickVideoChatItemAction()

    /// 点击红包
    func didClickRedEnvelopeItemAction()

    /// 点击位置
    func didClickLocationItemAction()
}

/// 聊天扩展视图
class ChatShareMoreView: UIView, NibReusable {

    @IBOutlet weak var shareCollectionView: UICollectionView!
    weak var delegate: ChatShareMoreViewDelegate?

    // 数据源 (以元组为单元)
    var itemDataSource: [(name: String, image: String)] = [
        ("照片", "sharemore_pic"),
        ("拍摄", "sharemore_video"),
        ("小视频", "sharemore_sight"),
        ("语音聊天", "sharemore_voiceinput"),
        ("视频聊天", "sharemore_videovoip"),
        ("红包", "sharemore_wallet"),
        ("位置", "sharemore_location"),
        ("收藏", "sharemore_myfav")
    ]

    override func awakeFromNib() {
        super.awakeFromNib()

        self.shareCollectionView.delegate = self
        self.shareCollectionView.dataSource = self
        self.shareCollectionView.isScrollEnabled = false
        self.shareCollectionView.backgroundColor = UIColor.white

        let flowLayout = UICollectionViewFlowLayout()
        let interSpacing: CGFloat = (UIScreen.width - 4 * 60 - 50) / 5.0
        let lineSpaceing: CGFloat = (216 - 2 * 85 - 20) / 3.0

        flowLayout.itemSize = CGSize(width: 60, height: 85)
        flowLayout.minimumInteritemSpacing = interSpacing
        flowLayout.minimumLineSpacing = lineSpaceing
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)

        self.shareCollectionView.collectionViewLayout = flowLayout
        self.shareCollectionView.register(UINib(nibName: "ChatShareCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ChatShareCollectionCell")
    }
}

// MARK: - UICollectionViewDataSource
extension ChatShareMoreView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let object = self.itemDataSource[(indexPath as NSIndexPath).row]

        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatShareCollectionCell", for: indexPath) as! ChatShareCollectionCell
        collectionCell.shareButton.setImage(UIImage(named: object.image), for: UIControlState())
        collectionCell.shareLabel.text = object.name

        return collectionCell
    }
}

// MARK: - UICollectionViewDelegate
extension ChatShareMoreView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        guard let delegate = self.delegate else { return }

        switch (indexPath as NSIndexPath).row {
        case 0: delegate.didClickPhotoItemAction(1)
        case 1: delegate.didClickCamaraItemAction()
        case 3: delegate.didClickAudioChatItemAction()
        case 4: delegate.didClickVideoChatItemAction()
        case 5: delegate.didClickRedEnvelopeItemAction()
        case 6: delegate.didClickLocationItemAction()
        default: break
        }
    }
}
