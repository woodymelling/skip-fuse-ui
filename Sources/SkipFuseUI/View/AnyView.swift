// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipUI

public struct AnyView : View {
    private let view: any View

    public init<V>(_ view: V) where V : View {
        self.init(erasing: view)
    }

    public init<V>(erasing view: V) where V : View {
        self.view = view
    }

    public typealias Body = Never
}

extension AnyView : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return view.Java_viewOrEmpty
    }
}
