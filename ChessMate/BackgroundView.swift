//
//  ChessBackgroundView.swift
//  ChessMate
//
//  Created by JK on 04/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import UIKit

protocol BackgroundPresenter {
    func centralRect() -> CGRect
}

class BackgroundView: UIView {
    private let Steps = 8
    private var presenter : BackgroundPresenter!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    convenience init(presenter: BackgroundPresenter) {
        self.init(frame: presenter.centralRect())
        self.presenter = presenter
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
