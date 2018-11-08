//
//  ViewController.swift
//  ChessMate
//
//  Created by JK on 04/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import UIKit

protocol PieceImageSetter {
    func setImageBy(piece: IPiece)
}

class PieceImageView: UIImageView, PieceImageSetter {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    func setImageBy(piece: IPiece) {
        self.image = piece.image()
    }
}

protocol GameManagerAction {
    func positionMap() -> Array<Array<IPiece?>>
}

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
        setupDefault(pieces: positionManager.positionMap())
    }
    
    func setManager(_ manager : GameManagerAction) {
        self.positionManager = manager
    }

    private func setupDefault(pieces: [[IPiece?]]) {
        var x = 0
        var y = 0
        for line in pieces {
            x = 0
            for piece in line {
                guard let piece = piece else { continue }
                let pieceImage = PieceImageView.init(image: piece.image())
                pieceImage.frame = geometricManager.rectAt(row: y, column: x)
                pieceImage.frame.origin.y += backgroundView.frame.origin.y
                self.view.addSubview(pieceImage)
                x += 1
            }
            y += 1
        }
    }
    
}


