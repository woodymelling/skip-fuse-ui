// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
#if !ROBOLECTRIC && canImport(CoreGraphics)
import CoreGraphics
#endif
import SkipUI

@frozen public struct Spacer : View, BitwiseCopyable, Sendable {
    public var minLength: CGFloat?

    @inlinable public init(minLength: CGFloat? = nil) {
        self.minLength = minLength
    }

    public typealias Body = Never
}

extension Spacer : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return SkipUI.Spacer(minLength: minLength)
    }
}

public struct SpacerSizing : Sendable {
    public static let flexible = SpacerSizing(identifier: 1) // For bridging
    public static let fixed = SpacerSizing(identifier: 2) // For bridging

    let identifier: Int // For bridging

    init(identifier: Int) {
        self.identifier = identifier
    }
}
