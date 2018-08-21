//
//  ViewController.swift
//  GuidePageView
//
//  Created by wubaolai on 2018/8/21.
//  Copyright © 2018年 wubaolai. All rights reserved.
//

import UIKit

let screen_w = UIScreen.main.bounds.size.width
let screen_h = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.red
        setGifGuidePage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: GuidePageImageCustomized {
    func setGifGuidePage() {
        let imageNamesGroup = ["Image6.gif","Image7.gif","Image8.gif"]
        if let guideView = GuidePageView(frame: UIScreen.main.bounds, imageNamesGroup: imageNamesGroup, delegate: self, showNewVersion: true) {
            navigationController?.view.addSubview(guideView)
        }
    }
    func guidePageCustomizedEnterButton(_ enterButton: UIButton) -> GuidePageImagePosition {
        enterButton.frame = CGRect(x: 0, y: 0 , width: 100, height: 50)
        enterButton.center = CGPoint(x: screen_w/2, y: screen_h-100)
        enterButton.backgroundColor = UIColor.red
        enterButton.setTitle("进入应用", for: .normal)
        return .pageIndex(0)
    }
    func guidePageCustomizedPageControl(_ pageControl: PageControl) {
        pageControl.isHidden = false
    }
    func guidePageCustomizedViews() -> [(UIView, GuidePageImagePosition)]? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = "SD卡焦点科技答复"
        return [(label, .pageIndex(0))]
    }
}

/// 视频
extension ViewController: GuidePageVideoCustomized {
    func setVideoGuidePage() {
        if let guideView = GuidePageView(frame: UIScreen.main.bounds, videoName: "video.mp4", delegate: self, showNewVersion: true) {
            navigationController?.view.addSubview(guideView)
        }
    }
    
    func guidePageCustomizedEnterButton(enterButton: UIButton) {
        enterButton.frame = CGRect(x: 0, y: 0 , width: 100, height: 50)
        enterButton.center = CGPoint(x: screen_w/2, y: screen_h-100)
        enterButton.backgroundColor = UIColor.red
        enterButton.setTitle("进入应用", for: .normal)
    }
    
    func guidePageCustomizedViews() -> [UIView]? {
        let button = UIButton(type: .custom)
        button.setTitle("跳过", for: .normal)
        button.frame = CGRect(x: screen_w-100, y: 60 , width: 70, height: 35)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor.red, for: .normal)
        return [button]
    }
}

