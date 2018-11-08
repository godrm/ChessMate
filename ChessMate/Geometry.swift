//
//  Geometry.swift
//  ChessMate
//
//  Created by JK on 08/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import Foundation
import CoreGraphics

struct GeometricManager : BackgroundPresenter {
    static let Steps = 8

    private var screenRect : CGRect
    private let pieceWidth : CGFloat
    private let pieceHeight : CGFloat
    private let verticalMargin : CGFloat
    
    init(screenBounds: CGRect) {
        screenRect = screenBounds
        pieceWidth = screenRect.width / CGFloat(GeometricManager.Steps)
        pieceHeight = pieceWidth
        verticalMargin = (screenRect.height - screenRect.width) / 2
    }
    
    func centralRect() -> CGRect {
        return CGRect(x: 0, y: verticalMargin,
                      width: screenRect.width, height: screenRect.width)
    }
    
    func rectAt(row: Int, column: Int) -> CGRect {
        return CGRect(x: CGFloat(column) * pieceWidth, y:  CGFloat(row) * pieceHeight, width: pieceWidth, height: pieceHeight)
    }
}
