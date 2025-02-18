// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipUI

// TODO: Actual implementation
public struct Color : ShapeStyle {
    public let spec: () -> ShapeStyleBridgeSpec

    public init(spec: @escaping () -> ShapeStyleBridgeSpec) {
        self.spec = spec
    }
}

extension ShapeStyle where Self == Color {
    public static var red: Color { Color(spec: { .color(.red) }) }
    public static var orange: Color { Color(spec: { .color(.orange) }) }
    public static var yellow: Color { Color(spec: { .color(.yellow) }) }
    public static var green: Color { Color(spec: { .color(.green) }) }
    public static var mint: Color { Color(spec: { .color(.mint) }) }
    public static var teal: Color { Color(spec: { .color(.teal) }) }
    public static var cyan: Color { Color(spec: { .color(.cyan) }) }
    public static var blue: Color { Color(spec: { .color(.blue) }) }
    public static var indigo: Color { Color(spec: { .color(.indigo) }) }
    public static var purple: Color { Color(spec: { .color(.purple) }) }
    public static var pink: Color { Color(spec: { .color(.pink) }) }
    public static var brown: Color { Color(spec: { .color(.brown) }) }
    public static var white: Color { Color(spec: { .color(.white) }) }
    public static var gray: Color { Color(spec: { .color(.gray) }) }
    public static var black: Color { Color(spec: { .color(.black) }) }
    public static var clear: Color { Color(spec: { .color(.clear) }) }
}
