// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import Foundation

//~~~ APPSTORAGE

@frozen @propertyWrapper public struct AppStorage<Value> : DynamicProperty {
    private let get: () -> Value
    private let set: (Value) -> Void

    public var wrappedValue: Value {
        get {
            return get()
        }
        nonmutating set {
            set(newValue)
        }
    }

    public var projectedValue: Binding<Value> {
        return Binding(get: { self.wrappedValue }, set: { self.wrappedValue = $0 })
    }
}

extension AppStorage {
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Bool {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.bool(forKey: key) }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Int {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.integer(forKey: key) }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Double {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.double(forKey: key) }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == String {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.string(forKey: key) ?? "" }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == URL {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.url(forKey: key)! }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Date {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { Date(timeIntervalSince1970: userDefaults.double(forKey: key)) }
        self.set = { userDefaults.set($0.timeIntervalSince1970, forKey: key) }
    }

    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value == Data {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.data(forKey: key)! }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value : RawRepresentable, Value.RawValue == Int {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { Value(rawValue: userDefaults.integer(forKey: key))! }
        self.set = { userDefaults.set($0.rawValue, forKey: key) }
    }

    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) where Value : RawRepresentable, Value.RawValue == String {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { Value(rawValue: userDefaults.string(forKey: key)!)! }
        self.set = { userDefaults.set($0.rawValue, forKey: key) }
    }
}

extension AppStorage where Value : ExpressibleByNilLiteral {
    public init(_ key: String, store: UserDefaults? = nil) where Value == Bool? {
        let userDefaults = store ?? UserDefaults.standard
        self.get = {
            let value = userDefaults.bool(forKey: key)
            return value || userDefaults.object(forKey: key) != nil ? value : nil
        }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(_ key: String, store: UserDefaults? = nil) where Value == Int? {
        let userDefaults = store ?? UserDefaults.standard
        self.get = {
            let value = userDefaults.integer(forKey: key)
            return value != 0 || userDefaults.object(forKey: key) != nil ? value : nil
        }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(_ key: String, store: UserDefaults? = nil) where Value == Double? {
        let userDefaults = store ?? UserDefaults.standard
        self.get = {
            let value = userDefaults.double(forKey: key)
            return value != 0.0 || userDefaults.object(forKey: key) != nil ? value : nil
        }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(_ key: String, store: UserDefaults? = nil) where Value == String? {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.string(forKey: key) }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(_ key: String, store: UserDefaults? = nil) where Value == URL? {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.url(forKey: key) }
        self.set = { userDefaults.set($0, forKey: key) }
    }

    public init(_ key: String, store: UserDefaults? = nil) where Value == Date? {
        let userDefaults = store ?? UserDefaults.standard
        self.get = {
            let value = userDefaults.double(forKey: key)
            return value != 0.0 || userDefaults.object(forKey: key) != nil ? Date(timeIntervalSince1970: value) : nil
        }
        self.set = { userDefaults.set($0?.timeIntervalSince1970, forKey: key) }
    }

    public init(_ key: String, store: UserDefaults? = nil) where Value == Data? {
        let userDefaults = store ?? UserDefaults.standard
        self.get = { userDefaults.data(forKey: key) }
        self.set = { userDefaults.set($0, forKey: key) }
    }
}

extension AppStorage {
    public init<R>(_ key: String, store: UserDefaults? = nil) where Value == R?, R : RawRepresentable, R.RawValue == String {
        let userDefaults = store ?? UserDefaults.standard
        self.get = {
            let value = userDefaults.string(forKey: key)
            return value == nil ? nil : R(rawValue: value!)
        }
        self.set = { userDefaults.set($0?.rawValue, forKey: key) }
    }

    public init<R>(_ key: String, store: UserDefaults? = nil) where Value == R?, R : RawRepresentable, R.RawValue == Int {
        let userDefaults = store ?? UserDefaults.standard
        self.get = {
            let value = userDefaults.integer(forKey: key)
            if value != 0 || userDefaults.object(forKey: key) != nil {
                return R(rawValue: value)
            } else {
                return nil
            }
        }
        self.set = { userDefaults.set($0?.rawValue, forKey: key) }
    }
}

//extension AppStorage : Sendable where Value : Sendable {
//}

//extension AppStorage {
//    public init<RowValue>(wrappedValue: Value = TableColumnCustomization<RowValue>(), _ key: String, store: UserDefaults? = nil) where Value == TableColumnCustomization<RowValue>, RowValue : Identifiable
//}

//extension AppStorage {
//    public init(wrappedValue: Value = ToolbarLabelStyle.automatic, _ key: String, store: UserDefaults? = nil) where Value == ToolbarLabelStyle
//}
//
//extension AppStorage {
//    public init(wrappedValue: Value = TabViewCustomization(), _ key: String, store: UserDefaults? = nil) where Value == TabViewCustomization
//}

extension View {
    @available(*, unavailable)
    /* nonisolated */ public func defaultAppStorage(_ store: UserDefaults) -> some View {
        stubView()
    }
}
