// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge
import SkipUI

@propertyWrapper public struct Environment<Value> : DynamicProperty {
    private let defaultValue: @Sendable () -> Value
    private let valueBox: Box<Box<Value>?> = Box(nil)

    public init(_ keyPath: KeyPath<EnvironmentValues, Value>) {
        self.key = EnvironmentValues.key(for: keyPath)
        self.defaultValue = { EnvironmentValues.shared[keyPath: keyPath] }
    }

    public var wrappedValue: Value {
        return valueBox.value!.value
    }

    public var projectedValue: Self {
        return self
    }

    public let key: String

    public func Java_syncEnvironmentSupport(_ support: EnvironmentSupport?) {
        if let support {
            if let valueHolder = support.valueHolder {
                valueBox.value = valueHolder.pointee()!
            } else {
                valueBox.value = Box(EnvironmentValues.builtin(key: key, bridgedValue: support.builtinValue) as! Value)
            }
        } else {
            valueBox.value = Box(defaultValue())
        }
    }
}

//extension Environment : Sendable where Value : Sendable {
//}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Environment {
    public init(_ objectType: Value.Type) where Value : AnyObject, Value : Observable {
        self.key = EnvironmentValues.key(for: objectType)
        self.defaultValue = { EnvironmentValues.shared[objectType]! }
    }

    public init<T>(_ objectType: T.Type) where Value == T?, T : AnyObject, T : Observable {
        self.key = EnvironmentValues.key(for: objectType)
        self.defaultValue = { EnvironmentValues.shared[objectType] }
    }
}
