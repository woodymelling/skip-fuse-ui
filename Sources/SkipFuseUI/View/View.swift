// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipFuse
import SkipUI

let logger: Logger = Logger(subsystem: "SkipFuseUI", category: "SkipFuseUI")

public protocol View {
    associatedtype Body: View
    @ViewBuilder @MainActor var body: Body { get }
}

public extension View where Body == Never {
    var body: Never { fatalError("Never") }
}

extension Optional : View where Wrapped : View {
    public var body: some View {
        if let self {
            return AnyView(erasing: self.body)
        } else {
            return AnyView(erasing: EmptyView())
        }
    }
}

extension Optional : SkipUIBridging where Wrapped : View {
    public var Java_view: any SkipUI.View {
        return (self as? SkipUIBridging)?.Java_view ?? SkipUI.EmptyView()
    }
}

extension Never : View {
    public typealias Body = Never
}

extension Never : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return SkipUI.EmptyView()
    }
}
