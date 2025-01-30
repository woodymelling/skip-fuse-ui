// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge
import SkipUI

public struct Button<Label>: View where Label: View {
    private let label: Label
    private let action: @MainActor () -> Void

    public init(action: @escaping @MainActor () -> Void, @ViewBuilder label: () -> Label) {
        self.label = label()
        self.action = action
    }

    public typealias Body = Never
}

extension Button where Label == Text {
    public init<S>(_ title: S, action: @escaping @MainActor () -> Void) where S : StringProtocol {
        self.label = Text(title)
        self.action = action
    }
}

#if os(Android)
extension Button: SkipUIBridging {
    public var Java_view: JavaObjectPointer? {
        return SkipUI.Button(anyLabel: (label as? SkipUIBridging)?.Java_view, action: action).toJavaObject(options: [])
    }
}
#endif
