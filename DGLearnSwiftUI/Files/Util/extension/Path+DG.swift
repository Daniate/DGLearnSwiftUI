//
//  Path+DG.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

extension Path {
    var reversed: Path {
        Path(
            UIBezierPath(cgPath: cgPath)
                .reversing()
                .cgPath
        )
    }
}
