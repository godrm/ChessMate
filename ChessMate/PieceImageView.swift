//
//  PieceImageView.swift
//  ChessMate
//
//  Created by JK on 08/11/2018.
//  Copyright © 2018 codesquad. All rights reserved.
//

import UIKit.UIImageView

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
