// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge
import SkipUI

public struct HStack<Content>: View where Content: View {
    private let alignment: VerticalAlignment
    private let spacing: CGFloat?
    private let content: any View

    public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public typealias Body = Never
}

#if os(Android)
extension HStack: SkipUIBridging {
    public var Java_view: JavaObjectPointer? {
        return SkipUI.HStack(alignmentKey: alignment.key, spacing: spacing, bridgedContent: (content as? SkipUIBridging)?.Java_view).toJavaObject(options: [])
    }
}
#endif

