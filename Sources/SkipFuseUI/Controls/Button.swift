// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipUI

// TODO: Actual implementation
public struct Button<Label> : View where Label : View {
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

extension Button : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        #if compiler(>=6.0)
        let isolatedAction = { MainActor.assumeIsolated { action() } }
        #else
        let isolatedAction = action
        #endif
        return SkipUI.Button(bridgedLabel: label.Java_viewOrEmpty, action: isolatedAction)
    }
}
