// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge

/// The base protocol for compiled `Views` to bridge to their corresponding `skip.ui.View` implementations.
public protocol ComposeBridging {
    /// The composable version of this view.
    ///
    /// The returned object must conform to `skip.ui.View`.
    @MainActor var Java_composable: JavaObjectPointer? { get }
}
