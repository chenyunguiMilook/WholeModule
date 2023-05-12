//
//  File.swift
//  
//
//  Created by chenyungui on 2023/5/10.
//

import Foundation
import UIKit

public class AnchorLayer<P: AnchorPath>: CALayer {
    public unowned let path: P
    
    public var isActive: Bool = false
    public var x: Double {
        get { position.x }
        set { position.x = newValue }
    }
    public var y: Double {
        get { position.y }
        set { position.y = newValue }
    }
    
    public init(path: P) {
        self.path = path
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public class AnchorPathLayer<A: Anchor>: CALayer {
    public var anchors: [A] = []
}

public final class CVAnchor: AnchorLayer<CVPath>, Anchor {
    
}

public final class CVPath: AnchorPathLayer<CVAnchor>, AnchorPath {
    
}
