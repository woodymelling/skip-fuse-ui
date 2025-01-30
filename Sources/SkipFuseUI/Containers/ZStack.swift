// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge
import SkipUI

public struct ZStack<Content>: View where Content: View {
    private let alignment: Alignment
    private let content: any View

    public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.content = content()
    }

    public typealias Body = Never
}

#if os(Android)
extension ZStack: SkipUIBridging {
    public var Java_view: JavaObjectPointer? {
        return SkipUI.ZStack(horizontalAlignmentKey: alignment.horizontal.key, verticalAlignmentKey: alignment.vertical.key, bridgedContent: (content as? SkipUIBridging)?.Java_view).toJavaObject(options: [])
    }
}
#endif
