// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge

public struct EmptyView: View {
    public init() {
    }

    public typealias Body = Never
}

extension EmptyView: Sendable {
}

extension EmptyView: ComposeBridging {
    public var Java_composable: JavaObjectPointer? {
        return try! Self.Java_class.create(ctor: Self.Java_constructor, options: [], args: [])
    }

    private static let Java_class = try! JClass(name: "skip.ui.EmptyView")
    private static let Java_constructor = Java_class.getMethodID(name: "<init>", sig: "()V")!
}
