// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
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
        return (view as? SkipUIBridging)?.Java_view ?? SkipUI.EmptyView()
    }
}
