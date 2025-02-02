// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
//#if os(Android)
import SkipUI
//#endif

@propertyWrapper public struct State<Value> : DynamicProperty {
    public init(wrappedValue value: Value) where Value : Equatable {
        self.valueBox = BridgedStateBox(value, comparator: { $0 == $1 })
    }

    public init(wrappedValue value: Value) {
        let comparator: (Value, Value) -> Bool
        if Value.self is AnyObject.Type {
            comparator = { ($0 as AnyObject) === ($1 as AnyObject) }
        } else {
            comparator = { _, _ in false }
        }
        self.valueBox = BridgedStateBox(value, comparator: comparator)
    }

    public init(initialValue value: Value) where Value : Equatable {
        self.init(wrappedValue: value)
    }

    public init(initialValue value: Value) {
        self.init(wrappedValue: value)
    }

    /// Accessible to generated bridging code.
    public let valueBox: BridgedStateBox<Value>

    public var wrappedValue: Value {
        get {
            return valueBox.value
        }
        nonmutating set {
            valueBox.value = newValue
        }
    }

    public var projectedValue: Binding<Value> {
        return Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
}

extension State : Sendable where Value : Sendable {
}

extension State where Value : ExpressibleByNilLiteral {
    public init() {
        self.init(wrappedValue: nil)
    }
}
