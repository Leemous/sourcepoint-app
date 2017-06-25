//
//  VCarInfoView.swift
//  
//  收车界面用来维护车辆基本信息view
//
//  Created by 姬鹏 on 2017/3/23.
//  Copyright © 2017年 tymaker. All rights reserved.
//

import UIKit

class VCarInfoView: UIView {
    var lisenceLabel: UILabel!
    var frameLabel: UILabel!
    var scrapValueLabel: UILabel!
    var memoLabel: UILabel!

    var lisenceText: TextFieldWithFinishButton!
    var frameText: TextFieldWithFinishButton!
    var scrapValueText: TextFieldWithFinishButton!
    var memoText: TextViewWithFinishButton!
    
    var carInfoViewDelegate = CarInfoViewDelegate()
    
    override func draw(_ rect: CGRect) {
        initView()

        // 如果有值，则赋值给文本框
        self.lisenceText.text = carInfoViewDelegate.lisenceNo
        self.frameText.text = carInfoViewDelegate.frameNo
        self.scrapValueText.text = carInfoViewDelegate.scrapValue
        self.memoText.text = carInfoViewDelegate.memo
    }
    
    private func initView() {
        // 设置所有标签
        // 车牌号标签
        self.lisenceLabel = UILabel()
        self.addSubview(self.lisenceLabel)
        self.lisenceLabel.font = systemFont
        self.lisenceLabel.textColor = mainTextColor
        self.lisenceLabel.text = "车牌号"
        self.lisenceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self.lisenceLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 18))
        self.addConstraint(NSLayoutConstraint(item: self.lisenceLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 18))

        // 车架号标签
        self.frameLabel = UILabel()
        self.addSubview(self.frameLabel)
        self.frameLabel.font = systemFont
        self.frameLabel.textColor = mainTextColor
        self.frameLabel.text = "车架号"
        self.frameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self.frameLabel, attribute: .leading, relatedBy: .equal, toItem: self.lisenceLabel, attribute: .leading, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.frameLabel, attribute: .top, relatedBy: .equal, toItem: self.lisenceLabel, attribute: .bottom, multiplier: 1, constant: 20))

        // 残值标签
        self.scrapValueLabel = UILabel()
        self.addSubview(self.scrapValueLabel)
        self.scrapValueLabel.font = systemFont
        self.scrapValueLabel.textColor = mainTextColor
        self.scrapValueLabel.text = "残值"
        self.scrapValueLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self.scrapValueLabel, attribute: .leading, relatedBy: .equal, toItem: self.frameLabel, attribute: .leading, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.scrapValueLabel, attribute: .top, relatedBy: .equal, toItem: self.frameLabel, attribute: .bottom, multiplier: 1, constant: 20))

        // 备注标签
        self.memoLabel = UILabel()
        self.addSubview(self.memoLabel)
        self.memoLabel.font = systemSmallFont
        self.memoLabel.textColor = systemTintColor
        self.memoLabel.text = "备注"
        self.memoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self.memoLabel, attribute: .leading, relatedBy: .equal, toItem: self.scrapValueLabel, attribute: .leading, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.memoLabel, attribute: .top, relatedBy: .equal, toItem: self.scrapValueLabel, attribute: .bottom, multiplier: 1, constant: 22))
        
        // 设置所有文本框
        // 车牌号文本框
        self.lisenceText = TextFieldWithFinishButton()
        self.addSubview(self.lisenceText)
        self.lisenceText.contentMode = .redraw
        self.lisenceText.font = textFont
        self.lisenceText.textColor = mainTextColor
        self.lisenceText.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self.lisenceText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 84))
        self.addConstraint(NSLayoutConstraint(item: self.lisenceText, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -18))
        self.addConstraint(NSLayoutConstraint(item: self.lisenceText, attribute: .centerY, relatedBy: .equal, toItem: self.lisenceLabel, attribute: .centerY, multiplier: 1, constant: 0))

        // 车架号文本框
        self.frameText = TextFieldWithFinishButton()
        self.addSubview(self.frameText)
        self.frameText.contentMode = .redraw
        self.frameText.font = textFont
        self.frameText.textColor = mainTextColor
        self.frameText.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self.frameText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 84))
        self.addConstraint(NSLayoutConstraint(item: self.frameText, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -18))
        self.addConstraint(NSLayoutConstraint(item: self.frameText, attribute: .centerY, relatedBy: .equal, toItem: self.frameLabel, attribute: .centerY, multiplier: 1, constant: 0))

        // 残值文本框
        self.scrapValueText = TextFieldWithFinishButton()
        self.addSubview(self.scrapValueText)
        self.scrapValueText.contentMode = .redraw
        self.scrapValueText.font = textFont
        self.scrapValueText.textColor = mainTextColor
        self.scrapValueText.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self.scrapValueText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 84))
        self.addConstraint(NSLayoutConstraint(item: self.scrapValueText, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -18))
        self.addConstraint(NSLayoutConstraint(item: self.scrapValueText, attribute: .centerY, relatedBy: .equal, toItem: self.scrapValueLabel, attribute: .centerY, multiplier: 1, constant: 0))

        // 备注文本框
        self.memoText = TextViewWithFinishButton()
        self.addSubview(self.memoText)
        self.memoText.contentMode = .redraw
        self.memoText.isEditable = true
        self.memoText.isSelectable = true
        self.memoText.textAlignment = .left
        self.memoText.backgroundColor = lightBackgroundColor
        self.memoText.font = textFont
        self.memoText.textColor = mainTextColor
        self.memoText.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self.memoText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 12))
        self.addConstraint(NSLayoutConstraint(item: self.memoText, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -12))
        self.addConstraint(NSLayoutConstraint(item: self.memoText, attribute: .top, relatedBy: .equal, toItem: self.memoLabel, attribute: .bottom, multiplier: 1, constant: 8))
        self.addConstraint(NSLayoutConstraint(item: self.memoText, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 118))
        
        // 为车牌号文本框设置下划线
        let hline1 = UIView()
        hline1.backgroundColor = separatorLineColor
        self.addSubview(hline1)
        hline1.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: hline1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1))
        self.addConstraint(NSLayoutConstraint(item: hline1, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 84))
        self.addConstraint(NSLayoutConstraint(item: hline1, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -18))
        self.addConstraint(NSLayoutConstraint(item: hline1, attribute: .top, relatedBy: .equal, toItem: self.lisenceText, attribute: .bottom, multiplier: 1, constant: 5))
        
        // 为车架号文本框设置下划线
        let hline2 = UIView()
        hline2.backgroundColor = separatorLineColor
        self.addSubview(hline2)
        hline2.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: hline2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1))
        self.addConstraint(NSLayoutConstraint(item: hline2, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 84))
        self.addConstraint(NSLayoutConstraint(item: hline2, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -18))
        self.addConstraint(NSLayoutConstraint(item: hline2, attribute: .top, relatedBy: .equal, toItem: self.frameText, attribute: .bottom, multiplier: 1, constant: 5))
        
        // 为残值文本框设置下划线
        let hline3 = UIView()
        hline3.backgroundColor = separatorLineColor
        self.addSubview(hline3)
        hline3.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: hline3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1))
        self.addConstraint(NSLayoutConstraint(item: hline3, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 84))
        self.addConstraint(NSLayoutConstraint(item: hline3, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -18))
        self.addConstraint(NSLayoutConstraint(item: hline3, attribute: .top, relatedBy: .equal, toItem: self.scrapValueText, attribute: .bottom, multiplier: 1, constant: 5))
        
        // 设置备注文本框的圆角边框
        let _ = drawRoundBorderForView(memoText, borderRadius: 6, borderWidth: 1, borderColor: systemTintColor)
    }
}

class TextFieldWithFinishButton: UITextField {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let bar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 40))
        bar.barStyle = .default
        
        let finishButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        finishButton.setTitle("完成", for: .normal)
        finishButton.setTitleColor(systemTintColor, for: .normal)
        finishButton.addTarget(self, action: #selector(TextFieldWithFinishButton.release(_:)), for: .touchUpInside)
        let barItem2 = UIBarButtonItem(customView: finishButton)

        let space = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth - finishButton.frame.width - 30, height: 25))
        let barItem1 = UIBarButtonItem(customView: space)
        
        bar.setItems([barItem1, barItem2], animated: true)

        self.inputAccessoryView = bar
    }
    
    func release(_ sender: AnyObject) {
        self.resignFirstResponder()
    }
}

class TextViewWithFinishButton: UITextView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let bar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 40))
        bar.barStyle = .default
        
        let finishButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        finishButton.setTitle("完成", for: .normal)
        finishButton.setTitleColor(systemTintColor, for: .normal)
        finishButton.addTarget(self, action: #selector(TextFieldWithFinishButton.release(_:)), for: .touchUpInside)
        let barItem2 = UIBarButtonItem(customView: finishButton)
        
        let space = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth - finishButton.frame.width - 30, height: 25))
        let barItem1 = UIBarButtonItem(customView: space)
        
        bar.setItems([barItem1, barItem2], animated: true)
        
        self.inputAccessoryView = bar
    }

    func release(_ sender: AnyObject) {
        self.resignFirstResponder()
    }
}

class CarInfoViewDelegate {
    var lisenceNo: String?
    var frameNo: String?
    var scrapValue: String?
    var memo: String?
}



























