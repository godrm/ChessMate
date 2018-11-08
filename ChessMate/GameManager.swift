//
//  GameManager.swift
//  ChessMate
//
//  Created by JK on 08/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import Foundation

protocol GameManagerAction {
    func positionMap(_ transform: (IPiece, Int, Int)->() )
}

struct GamePositionManager : GameManagerAction {
    func positionMap(_ transform: (IPiece, Int, Int)->() )
    {
        var x = 0
        var y = 0
        for line in positionTable {
            x = 0
            for piece in line {
                guard let piece = piece else { continue }
                transform(piece, y, x)
                x += 1
            }
            y += 1
        }
    }
    
    private var positionTable = Array<Array<IPiece?>>()
    
    init() {
        positionTable.append([PieceFactory.makeRook(color:  .black),
                            PieceFactory.makeKnight(color: .black),
                            PieceFactory.makeBishop(color: .black),
                            PieceFactory.makeKing(color: .black),
                            PieceFactory.makeQueen(color: .black),
                            PieceFactory.makeBishop(color: .black),
                            PieceFactory.makeKnight(color: .black),
                            PieceFactory.makeRook(color: .black)])
        positionTable.append([PieceFactory.makePawn(color: .black),
                            PieceFactory.makePawn(color: .black),
                            PieceFactory.makePawn(color: .black),
                            PieceFactory.makePawn(color: .black),
                            PieceFactory.makePawn(color: .black),
                            PieceFactory.makePawn(color: .black),
                            PieceFactory.makePawn(color: .black),
                            PieceFactory.makePawn(color: .black)])
        positionTable.append([])
        positionTable.append([])
        positionTable.append([])
        positionTable.append([])
        positionTable.append([PieceFactory.makePawn(color: .white),
                            PieceFactory.makePawn(color: .white),
                            PieceFactory.makePawn(color: .white),
                            PieceFactory.makePawn(color: .white),
                            PieceFactory.makePawn(color: .white),
                            PieceFactory.makePawn(color: .white),
                            PieceFactory.makePawn(color: .white),
                            PieceFactory.makePawn(color: .white)])
        positionTable.append([PieceFactory.makeRook(color: .white),
                            PieceFactory.makeKnight(color: .white),
                            PieceFactory.makeBishop(color: .white),
                            PieceFactory.makeKing(color: .white),
                            PieceFactory.makeQueen(color: .white),
                            PieceFactory.makeBishop(color: .white),
                            PieceFactory.makeKnight(color: .white),
                            PieceFactory.makeRook(color: .white)])
    }
}
