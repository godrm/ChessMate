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
    func rectAt(row: Int, column: Int) -> CGRect
}

class BackgroundView: UIView {
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
        var binaryFlag = false
        for y in 0..<GeometricManager.Steps {
            for x in 0..<GeometricManager.Steps {
                let boxFrame = presenter.rectAt(row: x, column: y)
                (binaryFlag ? UIColor.white : UIColor.darkGray).setFill()
                UIBezierPath.init(rect: boxFrame).fill()
                binaryFlag.toggle()
            }
            binaryFlag.toggle()
        }
    }
}
