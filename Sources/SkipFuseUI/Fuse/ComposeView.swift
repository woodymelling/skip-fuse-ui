// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge
import SkipUI

/// Embed Compose content in the SwiftUI view tree.
public struct ComposeView : View {
    private let content: any JConvertible

    /// Supply a block that returns a `SkipUI.ContentComposer`.
    public init(content: () -> any JConvertible) {
        self.content = content()
    }

    public typealias body = Never
}

extension ComposeView : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return SkipUI.ComposeView(bridgedContent: content)
    }
}
