// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

@propertyWrapper @dynamicMemberLookup public struct Binding<Value> {
    let get: () -> Value
    let set: (Value) -> Void

    @preconcurrency public init(valueBox: BridgedStateBox<Value>? = nil, get: @escaping @isolated(any) @Sendable () -> Value, set: @escaping @isolated(any) @Sendable (Value) -> Void) {
        self.valueBox = valueBox
        self.get = get
        self.set = set
    }

    public static func constant(_ value: Value) -> Binding<Value> {
        return Binding(get: { value }, set: { _ in })
    }

    /// The bound `@State's` bridged value box.
    ///
    /// This is exposed to generated code here rather than on the `State` because the property wrapper itself is considered
    /// private, but its projection is accessible to callers.
    public let valueBox: BridgedStateBox<Value>?

    public var wrappedValue: Value {
        get {
            get()
        }
        nonmutating set {
            set(newValue)
        }
    }

    public var projectedValue: Binding<Value> {
        return self
    }

    public init(projectedValue: Binding<Value>) {
        self = projectedValue
    }

    public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> {
        return Binding<Subject>(get: { wrappedValue[keyPath: keyPath] }, set: { wrappedValue[keyPath: keyPath] = $0 })
    }

//    /// Creates a binding with a closure that reads from the binding value, and
//    /// a closure that applies a transaction when writing to the binding value.
//    ///
//    /// A binding conforms to Sendable only if its wrapped value type also
//    /// conforms to Sendable. It is always safe to pass a sendable binding
//    /// between different concurrency domains. However, reading from or writing
//    /// to a binding's wrapped value from a different concurrency domain may or
//    /// may not be safe, depending on how the binding was created. SwiftUI will
//    /// issue a warning at runtime if it detects a binding being used in a way
//    /// that may compromise data safety.
//    ///
//    /// For a "computed" binding created using get and set closure parameters,
//    /// the safety of accessing its wrapped value from a different concurrency
//    /// domain depends on whether those closure arguments are isolated to
//    /// a specific actor. For example, a computed binding with closure arguments
//    /// that are known (or inferred) to be isolated to the main actor must only
//    /// ever access its wrapped value on the main actor as well, even if the
//    /// binding is also sendable.
//    ///
//    /// - Parameters:
//    ///   - get: A closure to retrieve the binding value. The closure has no
//    ///     parameters, and returns a value.
//    ///   - set: A closure to set the binding value. The closure has the
//    ///     following parameters:
//    ///       - newValue: The new value of the binding value.
//    ///       - transaction: The transaction to apply when setting a new value.
//    @preconcurrency public init(get: @escaping @isolated(any) @Sendable () -> Value, set: @escaping @isolated(any) @Sendable (Value, Transaction) -> Void)
//
//    /// The binding's transaction.
//    ///
//    /// The transaction captures the information needed to update the view when
//    /// the binding value changes.
//    public var transaction: Transaction
}

extension Binding {
    public init<V>(_ base: Binding<V>) where Value == V? {
        self.init(get: { base.wrappedValue }, set: { base.wrappedValue = $0! })
    }

    /// Creates a binding by projecting the base value to an unwrapped value.
    ///
    /// - Parameter base: A value to project to an unwrapped value.
    ///
    /// - Returns: A new binding or `nil` when `base` is `nil`.
    public init?(_ base: Binding<Value?>) {
        guard base.wrappedValue != nil else {
            return nil
        }
        self.init(get: { base.wrappedValue! }, set: { base.wrappedValue = $0 })
    }

    public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable {
        self.init(get: { AnyHashable(base.wrappedValue) }, set: { base.wrappedValue = $0.base as! V })
    }
}

extension Binding : @unchecked Sendable where Value : Sendable {
}

extension Binding : DynamicProperty {
}

extension Binding : Identifiable where Value : Identifiable {
    public var id: Value.ID {
        return wrappedValue.id
    }

    public typealias ID = Value.ID
}

extension Binding : Sequence where Value : MutableCollection {
    public typealias Element = Binding<Value.Element>
}

extension Binding : Collection where Value : MutableCollection {
    public typealias Index = Value.Index
    public typealias Indices = Value.Indices

    public var startIndex: Binding<Value>.Index {
        return wrappedValue.startIndex
    }

    public var endIndex: Binding<Value>.Index {
        return wrappedValue.endIndex
    }

    public var indices: Value.Indices {
        return wrappedValue.indices
    }

    public func index(after i: Binding<Value>.Index) -> Binding<Value>.Index {
        return wrappedValue.index(after: i)
    }

    public func formIndex(after i: inout Binding<Value>.Index) {
        wrappedValue.formIndex(after: &i)
    }

    public subscript(position: Binding<Value>.Index) -> Binding<Value>.Element {
        return Binding<Value.Element>(get: { wrappedValue[position] }, set: { wrappedValue[position] = $0 })
    }
}

extension Binding : BidirectionalCollection where Value : BidirectionalCollection, Value : MutableCollection {
    public func index(before i: Binding<Value>.Index) -> Binding<Value>.Index {
        return wrappedValue.index(before: i)
    }

    public func formIndex(before i: inout Binding<Value>.Index) {
        wrappedValue.formIndex(before: &i)
    }
}

extension Binding : RandomAccessCollection where Value : MutableCollection, Value : RandomAccessCollection {
}

//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension Binding {
//
//    /// Specifies a transaction for the binding.
//    ///
//    /// - Parameter transaction  : An instance of a ``Transaction``.
//    ///
//    /// - Returns: A new binding.
//    public func transaction(_ transaction: Transaction) -> Binding<Value>
//
//    /// Specifies an animation to perform when the binding value changes.
//    ///
//    /// - Parameter animation: An animation sequence performed when the binding
//    ///   value changes.
//    ///
//    /// - Returns: A new binding.
//    public func animation(_ animation: Animation? = .default) -> Binding<Value>
//}
