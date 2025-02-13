// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
@_exported import struct SkipUI.EmptyView
@_exported import class SkipUI.EnvironmentSupport
@_exported import class SkipUI.StateSupport
@_exported import protocol SkipUI.View

/// The base protocol for compiled `Views` to bridge to their corresponding `skip.ui.View` implementations.
public protocol SkipUIBridging {
    /// The composable SkipUI version of this view.
    @MainActor var Java_view: any SkipUI.View { get }
}

extension View {
    /// Return the bridging view if this view is `SkipUIBridging`, else `SkipUI.EmptyView`.
    @MainActor var Java_viewOrEmpty: any SkipUI.View {
        return (self as? SkipUIBridging)?.Java_view ?? SkipUI.EmptyView()
    }
}
