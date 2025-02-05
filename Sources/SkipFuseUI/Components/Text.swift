// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
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
