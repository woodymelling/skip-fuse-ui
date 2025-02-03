// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
#if os(Android)
import SkipBridge
import SkipUI
#endif

public final class BridgedStateBox<Value> {
    private let comparator: (Value, Value) -> Bool

    init(_ value: Value, comparator: @escaping (Value, Value) -> Bool) {
        self._value = Box(value)
        self.comparator = comparator
    }

    var value: Value {
        get {
            #if os(Android)
            Java_stateSupport?.access()
            #endif
            return _value.value
        }
        set {
            let isUpdate = !comparator(_value.value, newValue)
            _value.value = newValue
            if isUpdate {
                #if os(Android)
                Java_stateSupport?.update()
                #endif
            }
        }
    }
    private var _value: Box<Value>

    #if os(Android)
    private var Java_stateSupport: StateSupport?

    public func Java_initStateSupport() -> StateSupport {
        let ptr = SwiftObjectPointer.pointer(to: _value, retain: true)
        Java_stateSupport = StateSupport(valueHolder: ptr, finalizer: { ptr in
            ptr.release(as: Box<Value>.self)
            return SwiftObjectNil
        })
        return Java_stateSupport!
    }

    public func Java_syncStateSupport(_ support: StateSupport) {
        let box: Box<Value> = support.valueHolder.pointee()!
        _value.value = box.value
        Java_stateSupport = support
    }
    #endif

    private final class Box<V> {
        var value: V

        init(_ value: V) {
            self.value = value
        }
    }
}

extension BridgedStateBox : @unchecked Sendable where Value : Sendable {
}
