//
//  ChessBackgroundView.swift
//  ChessMate
//
//  Created by JK on 04/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import UIKit

class BackgroundView: UIView {
    private let Steps = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    convenience init() {
        self.init(frame: BackgroundView.centralRect())
    }
    
    private static func centralRect() -> CGRect {
        let screenRect = UIScreen.main.bounds
        let verticalMargin = (screenRect.height - screenRect.width) / 2
        return CGRect(x: 0, y: verticalMargin,
                      width: screenRect.width, height: screenRect.width)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let width = frame.width / CGFloat(Steps)
        let height = frame.height / CGFloat(Steps)
        var binaryFlag = false
        for y in 0..<Steps {
            for x in 0..<Steps {
                let boxFrame = CGRect(x: CGFloat(x) * width, y: CGFloat(y) * height,
                                      width: width, height: height)
                (binaryFlag ? UIColor.white : UIColor.darkGray).setFill()
                UIBezierPath.init(rect: boxFrame).fill()
                binaryFlag.toggle()
            }
            binaryFlag.toggle()
        }
    }
}
