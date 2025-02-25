// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipUI

struct ModifierView<Target> : View where Target : View {
    private let target: Target
    private let modifier: @MainActor (Target) -> any SkipUI.View

    init(target: Target, modifier: @MainActor @escaping (Target) -> any SkipUI.View) {
        self.target = target
        self.modifier = modifier
    }

    typealias Body = Never
}

extension ModifierView : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return modifier(target)
    }
}
