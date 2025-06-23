// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipUI

@frozen @preconcurrency public struct EquatableView<Content> where Content : Equatable, Content : View {
    public var content: Content

    @inlinable public init(content: Content) {
        self.content = content
    }
}

extension EquatableView : View {
    public typealias Body = Never
}

extension EquatableView : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return SkipUI.EquatableView(content: content.Java_viewOrEmpty)
    }
}

extension View where Self : Equatable {
    /* @inlinable */ nonisolated public func equatable() -> EquatableView<Self> {
        return EquatableView(content: self)
    }
}
