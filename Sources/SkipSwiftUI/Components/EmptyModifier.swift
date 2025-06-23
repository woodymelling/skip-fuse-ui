// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception

public struct EmptyModifier : ViewModifier /*, BitwiseCopyable, Sendable */ {
    public static let identity = EmptyModifier()

    @inlinable nonisolated public init() {
    }

//    public typealias Body = Never
    public func body(content: Content) -> some View {
        content
    }
}
