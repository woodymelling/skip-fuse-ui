// Copyright 2023–2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception

public enum ScenePhase : Int, Comparable, Hashable, Sendable {
    case background = 1 // For bridging
    case inactive = 2 // For bridging
    case active = 3 // For bridging

    public static func < (a: ScenePhase, b: ScenePhase) -> Bool {
        return a.rawValue < b.rawValue
    }
}
