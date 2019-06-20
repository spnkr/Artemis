import Foundation

public prefix func ...<T, SubSelection>(_ fragment: Fragment<T, SubSelection>) -> SubSelection {
    return fragment.subSelection
}

public protocol AnyFragment {
    associatedtype T: Schema
    associatedtype SubSelection: FieldAggregate
}

public struct Fragment<T, SubSelection: FieldAggregate> {
    public typealias Result = Never
    
    public var items: [AnyFieldAggregate] = []
    let subSelection: SubSelection
    
    public init(_ name: String, onInterface: T.Type, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.subSelection = subSelection()
        //        self.keyPath = keyPath
        //        self.alias = alias
        //        self.renderedSubSelection = subSelection().render()
        //        self.renderedArguments = nil
        //        self.error = nil
        //        self.field = T.QueryableType()[keyPath: keyPath]
    }
    
    public func createResult(from: [String : Any]) throws -> Never {
        fatalError()
    }
}
extension Fragment: FieldAggregate, AnyFieldAggregate where SubSelection.T == T {
    public init(_ name: String, on: T.Type, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.subSelection = subSelection()
        //        self.keyPath = keyPath
        //        self.alias = alias
        //        self.renderedSubSelection = subSelection().render()
        //        self.renderedArguments = nil
        //        self.error = nil
        //        self.field = T.QueryableType()[keyPath: keyPath]
    }
}