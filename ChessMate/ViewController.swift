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

class PieceImageView: UIImageView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
}

class ViewController: UIViewController {
    private var positionManager = GamePositionManager.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.lightGray
        self.view.addSubview(BackgroundView())
        setupDefault(pieces: positionManager.positionMap)
    }

    private func setupDefault(pieces: [[Piece?]]) {
        var x = 0
        var y = 0
        for line in pieces {
            x = 0
            for piece in line {
                guard let piece = piece else { continue }
                let pieceImage = PieceImageView.init(image: piece.type.image(color: piece.color.rawValue))
                pieceImage.frame = positionManager.defaultFrame(for: (x,y))
                self.view.addSubview(pieceImage)
                x += 1
            }
            y += 1
        }
    }
    
}

struct GamePositionManager {
    var positionMap = Array<Array<Piece?>>()
    
    init() {
        positionMap.append([Piece(type: .rook, color: .black),
                            Piece(type: .knight, color: .black),
                            Piece(type: .bishop, color: .black),
                            Piece(type: .king, color: .black),
                            Piece(type: .queen, color: .black),
                            Piece(type: .bishop, color: .black),
                            Piece(type: .knight, color: .black),
                            Piece(type: .rook, color: .black)])
        positionMap.append([Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black)])
        positionMap.append([])
        positionMap.append([])
        positionMap.append([])
        positionMap.append([])
        positionMap.append([Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white)])
        positionMap.append([Piece(type: .rook, color: .white),
                            Piece(type: .knight, color: .white),
                            Piece(type: .bishop, color: .white),
                            Piece(type: .king, color: .white),
                            Piece(type: .queen, color: .white),
                            Piece(type: .bishop, color: .white),
                            Piece(type: .knight, color: .white),
                            Piece(type: .rook, color: .white)])
    }
    
    public func defaultFrame(for path:(x : Int, y: Int)) -> CGRect {
        let Steps = 8
        let screenRect = UIScreen.main.bounds
        let verticalMargin = (screenRect.height - screenRect.width) / 2
        let frame = CGRect(x: 0, y: verticalMargin,
                      width: screenRect.width, height: screenRect.width)
        let width = frame.width / CGFloat(Steps)
        let height = frame.height / CGFloat(Steps)
        return CGRect(x: CGFloat(path.x) * width, y: verticalMargin + CGFloat(path.y) * height, width: width, height: height)
    }

}
