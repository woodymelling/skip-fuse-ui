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

//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//extension Binding : Sequence where Value : MutableCollection {
//
//    /// A type representing the sequence's elements.
//    public typealias Element = Binding<Value.Element>
//
//    /// A type that provides the sequence's iteration interface and
//    /// encapsulates its iteration state.
//    public typealias Iterator = IndexingIterator<Binding<Value>>
//
//    /// A collection representing a contiguous subrange of this collection's
//    /// elements. The subsequence shares indices with the original collection.
//    ///
//    /// The default subsequence type for collections that don't define their own
//    /// is `Slice`.
//    public typealias SubSequence = Slice<Binding<Value>>
//}
//
//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//extension Binding : Collection where Value : MutableCollection {
//
//    /// A type that represents a position in the collection.
//    ///
//    /// Valid indices consist of the position of every element and a
//    /// "past the end" position that's not valid for use as a subscript
//    /// argument.
//    public typealias Index = Value.Index
//
//    /// A type that represents the indices that are valid for subscripting the
//    /// collection, in ascending order.
//    public typealias Indices = Value.Indices
//
//    /// The position of the first element in a nonempty collection.
//    ///
//    /// If the collection is empty, `startIndex` is equal to `endIndex`.
//    public var startIndex: Binding<Value>.Index { get }
//
//    /// The collection's "past the end" position---that is, the position one
//    /// greater than the last valid subscript argument.
//    ///
//    /// When you need a range that includes the last element of a collection, use
//    /// the half-open range operator (`..<`) with `endIndex`. The `..<` operator
//    /// creates a range that doesn't include the upper bound, so it's always
//    /// safe to use with `endIndex`. For example:
//    ///
//    ///     let numbers = [10, 20, 30, 40, 50]
//    ///     if let index = numbers.firstIndex(of: 30) {
//    ///         print(numbers[index ..< numbers.endIndex])
//    ///     }
//    ///     // Prints "[30, 40, 50]"
//    ///
//    /// If the collection is empty, `endIndex` is equal to `startIndex`.
//    public var endIndex: Binding<Value>.Index { get }
//
//    /// The indices that are valid for subscripting the collection, in ascending
//    /// order.
//    ///
//    /// A collection's `indices` property can hold a strong reference to the
//    /// collection itself, causing the collection to be nonuniquely referenced.
//    /// If you mutate the collection while iterating over its indices, a strong
//    /// reference can result in an unexpected copy of the collection. To avoid
//    /// the unexpected copy, use the `index(after:)` method starting with
//    /// `startIndex` to produce indices instead.
//    ///
//    ///     var c = MyFancyCollection([10, 20, 30, 40, 50])
//    ///     var i = c.startIndex
//    ///     while i != c.endIndex {
//    ///         c[i] /= 5
//    ///         i = c.index(after: i)
//    ///     }
//    ///     // c == MyFancyCollection([2, 4, 6, 8, 10])
//    public var indices: Value.Indices { get }
//
//    /// Returns the position immediately after the given index.
//    ///
//    /// The successor of an index must be well defined. For an index `i` into a
//    /// collection `c`, calling `c.index(after: i)` returns the same index every
//    /// time.
//    ///
//    /// - Parameter i: A valid index of the collection. `i` must be less than
//    ///   `endIndex`.
//    /// - Returns: The index value immediately after `i`.
//    public func index(after i: Binding<Value>.Index) -> Binding<Value>.Index
//
//    /// Replaces the given index with its successor.
//    ///
//    /// - Parameter i: A valid index of the collection. `i` must be less than
//    ///   `endIndex`.
//    public func formIndex(after i: inout Binding<Value>.Index)
//
//    /// Accesses the element at the specified position.
//    ///
//    /// The following example accesses an element of an array through its
//    /// subscript to print its value:
//    ///
//    ///     var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
//    ///     print(streets[1])
//    ///     // Prints "Bryant"
//    ///
//    /// You can subscript a collection with any valid index other than the
//    /// collection's end index. The end index refers to the position one past
//    /// the last element of a collection, so it doesn't correspond with an
//    /// element.
//    ///
//    /// - Parameter position: The position of the element to access. `position`
//    ///   must be a valid index of the collection that is not equal to the
//    ///   `endIndex` property.
//    ///
//    /// - Complexity: O(1)
//    public subscript(position: Binding<Value>.Index) -> Binding<Value>.Element { get }
//}
//
//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//extension Binding : BidirectionalCollection where Value : BidirectionalCollection, Value : MutableCollection {
//
//    /// Returns the position immediately before the given index.
//    ///
//    /// - Parameter i: A valid index of the collection. `i` must be greater than
//    ///   `startIndex`.
//    /// - Returns: The index value immediately before `i`.
//    public func index(before i: Binding<Value>.Index) -> Binding<Value>.Index
//
//    /// Replaces the given index with its predecessor.
//    ///
//    /// - Parameter i: A valid index of the collection. `i` must be greater than
//    ///   `startIndex`.
//    public func formIndex(before i: inout Binding<Value>.Index)
//}
//
//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//extension Binding : RandomAccessCollection where Value : MutableCollection, Value : RandomAccessCollection {
//}
//
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
