//
//  GameManager.swift
//  ChessMate
//
//  Created by JK on 08/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import Foundation

struct GamePositionManager : GameManagerAction {
    func positionMap() -> Array<Array<Piece?>> {
        return positionTable
    }
    
    private var positionTable = Array<Array<Piece?>>()
    
    init() {
        positionTable.append([Piece(type: .rook, color: .black),
                            Piece(type: .knight, color: .black),
                            Piece(type: .bishop, color: .black),
                            Piece(type: .king, color: .black),
                            Piece(type: .queen, color: .black),
                            Piece(type: .bishop, color: .black),
                            Piece(type: .knight, color: .black),
                            Piece(type: .rook, color: .black)])
        positionTable.append([Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black),
                            Piece(type: .pawn, color: .black)])
        positionTable.append([])
        positionTable.append([])
        positionTable.append([])
        positionTable.append([])
        positionTable.append([Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white),
                            Piece(type: .pawn, color: .white)])
        positionTable.append([Piece(type: .rook, color: .white),
                            Piece(type: .knight, color: .white),
                            Piece(type: .bishop, color: .white),
                            Piece(type: .king, color: .white),
                            Piece(type: .queen, color: .white),
                            Piece(type: .bishop, color: .white),
                            Piece(type: .knight, color: .white),
                            Piece(type: .rook, color: .white)])
    }
}
