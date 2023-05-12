//
//  File.swift
//  
//
//  Created by chenyungui on 2023/5/10.
//

import Foundation
import UIKit

public protocol Anchor: CALayer {
    associatedtype P: AnchorPath where P.A == Self
    
    var path: P { get }
}

public protocol AnchorPath: CALayer {
    associatedtype A: Anchor where A.P == Self
    
    var anchors: [A] { get set }
}



