// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
#if !ROBOLECTRIC && canImport(CoreGraphics)
import CoreGraphics
#endif
import SkipUI

@frozen public struct HStack<Content>where Content : View {
    private let alignment: VerticalAlignment
    private let spacing: CGFloat?
    private let content: Content

    /* @inlinable */ public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }
}

extension HStack : View {
    public typealias Body = Never
}

extension HStack : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return SkipUI.HStack(alignmentKey: alignment.key, spacing: spacing, bridgedContent: content.Java_viewOrEmpty)
    }
}
