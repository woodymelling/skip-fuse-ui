// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipUI

// TODO: Actual implementation
public struct Text : View {
    private let text: String

    public init<S>(_ text: S) where S : StringProtocol {
        self.text = String(text)
    }

    public typealias Body = Never
}

extension Text : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return SkipUI.Text(verbatim: text)
    }
}
