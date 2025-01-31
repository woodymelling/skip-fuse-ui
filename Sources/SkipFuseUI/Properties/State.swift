// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
@preconcurrency import SkipBridge

@propertyWrapper public struct State<Value> : DynamicProperty {
    private let value: StateBox<Value>
    private let comparator: @Sendable (Value, Value) -> Bool

    public init(wrappedValue value: Value) where Value : Equatable {
        self.value = StateBox(value)
        self.comparator = { $0 == $1 }
        #if os(Android)
        self.Java_state = Java_initState()
        #endif
    }

    public init(wrappedValue value: Value) {
        self.value = StateBox(value)
        if Value.self is AnyObject.Type {
            self.comparator = { ($0 as AnyObject) === ($1 as AnyObject) }
        } else {
            self.comparator = { _, _ in false }
        }
        #if os(Android)
        self.Java_state = Java_initState()
        #endif
    }

    public init(initialValue value: Value) where Value : Equatable {
        self.init(wrappedValue: value)
    }

    public init(initialValue value: Value) {
        self.init(wrappedValue: value)
    }

    public var wrappedValue: Value {
        get {
            #if os(Android)
            Java_access()
            #endif
            return value.value
        }
        nonmutating set {
            #if os(Android)
            let isUpdate = !comparator(value.value, newValue)
            #endif
            value.value = newValue
            #if os(Android)
            if isUpdate {
                Java_update()
            }
            #endif
        }
    }

    public var projectedValue: Binding<Value> {
        return Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }

    #if os(Android)
    private let Java_state: JObject

    private func Java_access() {
        jniContext {
            try! Java_state.call(method: Java_state_access_methodID, options: [], args: [])
        }
    }

    private func Java_update() {
        jniContext {
            try! Java_state.call(method: Java_state_update_methodID, options: [], args: [])
        }
    }
    #endif
}

#if os(Android)
private let Java_stateClass = try! JClass(name: "skip/model/MutableStateBox")
private let Java_state_init_methodID = Java_stateClass.getMethodID(name: "<init>", sig: "()V")!
private let Java_state_access_methodID = Java_stateClass.getMethodID(name: "access", sig: "()V")!
private let Java_state_update_methodID = Java_stateClass.getMethodID(name: "update", sig: "()V")!

private func Java_initState() -> JObject {
    return jniContext {
        return try! JObject(Java_stateClass.create(ctor: Java_state_init_methodID, options: [], args: []))
    }
}
#endif

extension State : Sendable where Value : Sendable {
}

extension State where Value : ExpressibleByNilLiteral {
    public init() {
        self.init(wrappedValue: nil)
    }
}

