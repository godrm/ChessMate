//
//  Piece.swift
//  ChessMate
//
//  Created by JK on 08/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import Foundation
import UIKit.UIImage

enum PieceType {
    case pawn
    case king
    case queen
    case rook
    case bishop
    case knight
}

enum PieceColor: String {
    case white = "white"
    case black = "black"
}

protocol IPiece {
    var color : PieceColor { get }
    func image() -> UIImage?
}

struct Pawn : IPiece {
    private(set) var color : PieceColor
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func image() -> UIImage? {
        return UIImage.init(named: "pawn-"+color.rawValue)
    }
}

struct King : IPiece {
    private(set) var color : PieceColor
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func image() -> UIImage? {
        return UIImage.init(named: "king-"+color.rawValue)
    }
}

struct Queen : IPiece {
    private(set) var color : PieceColor
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func image() -> UIImage? {
        return UIImage.init(named: "queen-"+color.rawValue)
    }
}

struct Rook : IPiece {
    private(set) var color : PieceColor
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func image() -> UIImage? {
        return UIImage.init(named: "rook-"+color.rawValue)
    }
}

struct Bishop : IPiece {
    private(set) var color : PieceColor
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func image() -> UIImage? {
        return UIImage.init(named: "bishop-"+color.rawValue)
    }
}

struct Knight : IPiece {
    private(set) var color : PieceColor
    
    init(color: PieceColor) {
        self.color = color
    }
    
    func image() -> UIImage? {
        return UIImage.init(named: "knight-"+color.rawValue)
    }
}


struct PieceFactory {
    static func makePawn(color: PieceColor) -> IPiece {
        return Pawn(color: color)
    }
    static func makeKing(color: PieceColor) -> IPiece {
        return King(color: color)
    }
    static func makeQueen(color: PieceColor) -> IPiece {
        return Queen(color: color)
    }
    static func makeRook(color: PieceColor) -> IPiece {
        return Rook(color: color)
    }
    static func makeBishop(color: PieceColor) -> IPiece {
        return Bishop(color: color)
    }
    static func makeKnight(color: PieceColor) -> IPiece {
        return Knight(color: color)
    }
}
