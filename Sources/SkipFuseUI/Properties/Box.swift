// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

final class Box<Value> {
    var value: Value

    init(_ value: Value) {
        self.value = value
    }
}

//extension Box : @unchecked Sendable where Value : Sendable {
//}
