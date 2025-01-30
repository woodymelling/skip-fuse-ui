// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge
import SkipUI

extension View {
    nonisolated public func border<S>(_ content: S, width: CGFloat = 1) -> some View where S: ShapeStyle {
        return ModifierView(target: self) {
            let view = ($0 as? SkipUIBridging)?.Java_view
            let modified = borderViewModifier(bridgedTarget: view, styleSpec: content.spec(), width: width)
            return (modified as? JConvertible)?.toJavaObject(options: [])
        }
    }

    nonisolated public func foregroundColor(_ color: Color?) -> some View {
        return ModifierView(target: self) {
            let view = ($0 as? SkipUIBridging)?.Java_view
            let modified = foregroundColorViewModifier(bridgedTarget: view, styleSpec: color?.spec())
            return (modified as? JConvertible)?.toJavaObject(options: [])
        }
    }

    nonisolated public func foregroundStyle<S>(_ style: S) -> some View where S: ShapeStyle {
        return ModifierView(target: self) {
            let view = ($0 as? SkipUIBridging)?.Java_view
            let modified = foregroundStyleViewModifier(bridgedTarget: view, styleSpec: style.spec())
            return (modified as? JConvertible)?.toJavaObject(options: [])
        }
    }
}
