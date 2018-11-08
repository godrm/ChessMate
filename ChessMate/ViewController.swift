//
//  ViewController.swift
//  ChessMate
//
//  Created by JK on 04/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import UIKit


enum PieceType {
    case pawn
    case king
    case queen
    case rook
    case bishop
    case knight
    
    func image(color: String) -> UIImage? {
        switch self {
        case .pawn:
            return UIImage.init(named: "pawn-"+color)
        case .king:
            return UIImage.init(named: "king-"+color)
        case .queen:
            return UIImage.init(named: "queen-"+color)
        case .rook:
            return UIImage.init(named: "rook-"+color)
        case .bishop:
            return UIImage.init(named: "bishop-"+color)
        case .knight:
            return UIImage.init(named: "knight-"+color)
        default:
            return nil
        }
    }
}

enum PieceColor: String {
    case white = "white"
    case black = "black"
}

struct Piece {
    let type : PieceType
    let color : PieceColor
    
}

protocol PieceImageSetter {
    func setImageBy(piece: Piece)
}

class PieceImageView: UIImageView, PieceImageSetter {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    func setImageBy(piece: Piece) {
        self.image = piece.type.image(color: piece.color.rawValue)
    }
}

protocol GameManagerAction {
    func positionMap() -> Array<Array<Piece?>>
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

    private func setupDefault(pieces: [[Piece?]]) {
        var x = 0
        var y = 0
        for line in pieces {
            x = 0
            for piece in line {
                guard let piece = piece else { continue }
                let pieceImage = PieceImageView.init(image: piece.type.image(color: piece.color.rawValue))
                pieceImage.frame = geometricManager.rectAt(row: y, column: x)
                pieceImage.frame.origin.y += backgroundView.frame.origin.y
                self.view.addSubview(pieceImage)
                x += 1
            }
            y += 1
        }
    }
    
}


