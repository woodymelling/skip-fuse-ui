// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipUI

public enum ColorScheme : Int, CaseIterable, Hashable /*, Sendable */ {
    case light = 0 // For bridging
    case dark = 1 // For bridging
}

extension View {
    nonisolated public func colorScheme(_ colorScheme: ColorScheme) -> some View {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.colorScheme(bridgedColorScheme: colorScheme.rawValue)
        }
    }

    nonisolated public func preferredColorScheme(_ colorScheme: ColorScheme?) -> some View {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.preferredColorScheme(bridgedColorScheme: colorScheme?.rawValue)
        }
    }
}
