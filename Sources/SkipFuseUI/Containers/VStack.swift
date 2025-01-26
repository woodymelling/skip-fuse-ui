// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge

// TODO: Actual implementation
public struct VStack<Content>: View where Content: View {
    public init(@ViewBuilder content: () -> Content) {

    }

    public typealias Body = Never
}

extension VStack: ComposeBridging {
    public var Java_composable: JavaObjectPointer? {
        return try! Self.Java_class.create(ctor: Self.Java_constructor, options: [], args: [text.toJavaParameter(options: [])])
    }

    private static let Java_class = try! JClass(name: "skip.ui.Text")
    private static let Java_constructor = Java_class.getMethodID(name: "<init>", sig: "(Ljava/lang/String;)V")!
}

