//
//  CVPath+Extension.swift
//  TestCrossModule
//
//  Created by chenyungui on 2023/5/10.
//

import Foundation

extension CVPath: TableProtocol {
    public typealias Row = TableRow<CVPath, TableColumn<CVAnchor>>
    public typealias Column = TableColumn<CVAnchor>
    
    public var rows: [Row] {
        let hasSelected = self.anchors.contains{ $0.isActive }
        return self.anchors.enumerated().compactMap { index, knot in
            if !hasSelected || (hasSelected && knot.isActive) {
                return Row(data: knot, name: "knot[\(index)]")
            } else {
                return nil
            }
        }
    }
    
    public var columns: [Column] {
        return [
            Column(name: "x", keyPath: \.x),
            Column(name: "y", keyPath: \.y)
        ]
    }
}
