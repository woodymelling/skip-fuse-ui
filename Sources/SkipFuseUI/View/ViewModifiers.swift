// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge
import SkipUI

extension View {
    nonisolated public func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.border(styleSpec: content.spec(), width: width)
        }
    }

    nonisolated public func colorInvert() -> some View {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.colorInvert()
        }
    }

    nonisolated public func foregroundColor(_ color: Color?) -> some View {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.foregroundColor(styleSpec: color?.spec())
        }
    }

    nonisolated public func foregroundStyle<S>(_ style: S) -> some View where S : ShapeStyle {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.foregroundStyle(styleSpec: style.spec())
        }
    }

    nonisolated public func tag<V>(_ tag: V, includeOptional: Bool = true) -> some View where V : Hashable {
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.tag(SwiftHashable(tag)) // Tag with bridgable wrapper
        }
    }
}
