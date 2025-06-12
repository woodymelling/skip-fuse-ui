// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception

public struct SymbolVariants : Hashable, Sendable {
    public static let none = SymbolVariants()
    public static let circle = SymbolVariants()
    public static let square = SymbolVariants()
    public static let rectangle = SymbolVariants()

    public var circle: SymbolVariants {
        return self
    }
    public var square: SymbolVariants {
        return self
    }
    public var rectangle: SymbolVariants {
        return self
    }

    public static let fill = SymbolVariants()

    public var fill: SymbolVariants {
        return self
    }

    public static let slash = SymbolVariants()

    public var slash: SymbolVariants {
        return self
    }

    public func contains(_ other: SymbolVariants) -> Bool {
        fatalError()
    }
}

public struct SymbolRenderingMode : Sendable {
    public static let monochrome = SymbolRenderingMode()
    public static let multicolor = SymbolRenderingMode()
    public static let hierarchical = SymbolRenderingMode()
    public static let palette = SymbolRenderingMode()
}

public struct SymbolVariableValueMode : Equatable, Sendable {
    public static let color = SymbolVariableValueMode()
    public static let draw = SymbolVariableValueMode()
}

public struct SymbolColorRenderingMode : Equatable, Sendable {
    public static let flat = SymbolColorRenderingMode()
    public static let gradient = SymbolColorRenderingMode()
}

extension View {
    @available(*, unavailable)
    nonisolated public func symbolEffect(_ effect: Any, options: Any? = nil /* SymbolEffectOptions = .default */, isActive: Bool = true) -> some View {
        return stubView()
    }

    @available(*, unavailable)
    nonisolated public func symbolEffect(_ effect: Any, options: Any? = nil /* SymbolEffectOptions = .default */, value: Any) -> some View {
        return stubView()
    }

    @available(*, unavailable)
    nonisolated public func symbolRenderingMode(_ mode: SymbolRenderingMode?) -> some View {
        return stubView()
    }

    @available(*, unavailable)
    nonisolated public func symbolVariant(_ variant: SymbolVariants) -> some View {
        return stubView()
    }

    @available(*, unavailable)
    nonisolated public func symbolVariableValueMode(_ mode: SymbolVariableValueMode?) -> some View {
        stubView()
    }

    @available(*, unavailable)
    nonisolated public func symbolColorRenderingMode(_ mode: SymbolColorRenderingMode?) -> some View {
        stubView()
    }
}

extension Image {
    @available(*, unavailable)
    public func symbolRenderingMode(_ mode: SymbolRenderingMode?) -> Image {
        fatalError()
    }

    @available(*, unavailable)
    public func symbolVariableValueMode(_ mode: SymbolVariableValueMode?) -> Image {
        fatalError()
    }

    @available(*, unavailable)
    public func symbolColorRenderingMode(_ mode: SymbolColorRenderingMode?) -> Image {
        fatalError()
    }
}
