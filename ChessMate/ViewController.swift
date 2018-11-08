//
//  ViewController.swift
//  ChessMate
//
//  Created by JK on 04/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var positionManager : GameManagerAction?
    private var geometricManager = GeometricManager(screenBounds: UIScreen.main.bounds)
    private var backgroundView : BackgroundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.lightGray
        backgroundView = BackgroundView.init(presenter: geometricManager)
        self.view.addSubview(backgroundView)
        guard let positionManager = positionManager else { return }
        setupDefault()
    }
    
    func setManager(_ manager : GameManagerAction) {
        self.positionManager = manager
    }

    private func setupDefault() {
        positionManager?.positionMap({ (piece, row, column) in
                let pieceImage = PieceImageView.init(image: piece.image())
                pieceImage.frame = geometricManager.rectAt(row: row, column: column)
                pieceImage.frame.origin.y += backgroundView.frame.origin.y
                self.view.addSubview(pieceImage)
            })
    }
    
}


