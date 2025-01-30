// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge

struct ModifierView<Target>: View where Target: View {
    private let target: Target
    private let modifier: @MainActor (Target) -> JavaObjectPointer?

    init(target: Target, modifier: @MainActor @escaping (Target) -> JavaObjectPointer?) {
        self.target = target
        self.modifier = modifier
    }

    typealias Body = Never
}

#if os(Android)
extension ModifierView: SkipUIBridging {
    public var Java_view: JavaObjectPointer? {
        return modifier(target)
    }
}
#endif
