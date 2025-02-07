// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

public protocol EnvironmentKey {
    associatedtype Value

    static var defaultValue: Self.Value { get }
}
