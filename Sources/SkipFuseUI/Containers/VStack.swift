// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
#if os(Android)
import SkipBridge
import SkipUI
#endif

public struct VStack<Content> : View where Content : View {
    private let alignment: HorizontalAlignment
    private let spacing: CGFloat?
    private let content: any View

    public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public typealias Body = Never
}

#if os(Android)
extension VStack : SkipUIBridging {
    public var Java_view: JavaObjectPointer? {
        return SkipUI.VStack(alignmentKey: alignment.key, spacing: spacing, bridgedContent: (content as? SkipUIBridging)?.Java_view).toJavaObject(options: [])
    }
}
#endif
