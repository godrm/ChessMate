//
//  Geometry.swift
//  ChessMate
//
//  Created by JK on 08/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import Foundation
import UIKit.UIScreen

struct GeometricManager : BackgroundPresenter {
    func centralRect() -> CGRect {
        let screenRect = UIScreen.main.bounds
        let verticalMargin = (screenRect.height - screenRect.width) / 2
        return CGRect(x: 0, y: verticalMargin,
                      width: screenRect.width, height: screenRect.width)
    }
}
