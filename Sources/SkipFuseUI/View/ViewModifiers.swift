// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
#if canImport(CoreGraphics)
import CoreGraphics
#endif
import SkipBridge
import SkipUI

extension View {
    nonisolated public func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.border(content.Java_view as! any SkipUI.ShapeStyle, width: width)
        }
    }

    nonisolated public func colorInvert() -> some View {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.colorInvert()
        }
    }

    nonisolated public func foregroundColor(_ color: Color?) -> some View {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.foregroundColor(color?.Java_view as? SkipUI.Color)
        }
    }

    nonisolated public func foregroundStyle<S>(_ style: S) -> some View where S : ShapeStyle {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.foregroundStyle(style.Java_view as! any SkipUI.ShapeStyle)
        }
    }

    nonisolated public func tag<V>(_ tag: V, includeOptional: Bool = true) -> some View where V : Hashable {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.tag(SwiftHashable(tag)) // Tag with bridgable wrapper
        }
    }
}
