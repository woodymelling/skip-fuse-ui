// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
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
