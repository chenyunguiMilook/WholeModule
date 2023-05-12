import Foundation

public protocol TableProtocol: AnyObject {
    associatedtype Row: TableRowProtocol
    associatedtype Column: TableColummProtocol where Column.RowContent == Self.Row.Value
    var name: String? { get }
    var rows: [Row] { get }
    var columns: [Column] { get }
}

public protocol TableRowProtocol: AnyObject {
    associatedtype Value
    var name: String { get }
    var data: Value { get set }
}

public protocol TableColummProtocol {
    associatedtype RowContent
    var name: String { get }
    var keyPath: WritableKeyPath<RowContent, Double> { get }
}

public class TableRow<Value, Column: TableColummProtocol>: TableRowProtocol {
    public var name: String
    public var data: Column.RowContent
    
    public init(data: Column.RowContent, name: String) {
        self.data = data
        self.name = name
    }
}

public class TableColumn<Value>: TableColummProtocol {
    public var name: String
    public var keyPath: WritableKeyPath<Value, Double>
    
    public init(name: String, keyPath: WritableKeyPath<Value, Double>) {
        self.name = name
        self.keyPath = keyPath
    }
}
