// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception

@resultBuilder public struct ViewBuilder {
    public static func buildBlock() -> EmptyView {
        return EmptyView()
    }

    public static func buildExpression<Content>(_ content: Content) -> Content where Content : View {
        return content
    }

    public static func buildBlock<Content>(_ content: Content) -> Content where Content : View {
        return content
    }

//    public static func buildBlock<each Content>(_ content: repeat each Content) -> TupleView<(repeat each Content)> where repeat each Content: View
}

extension ViewBuilder {
    public static func buildIf<Content>(_ content: Content?) -> AnyView where Content : View {
        if let content {
            return AnyView(erasing: content)
        } else {
            return AnyView(erasing: EmptyView())
        }
    }

    public static func buildEither<TrueContent>(first: TrueContent) -> TrueContent where TrueContent : View {
        return first
    }

    public static func buildEither<FalseContent>(second: FalseContent) -> FalseContent where FalseContent : View {
        return second
    }
}

extension ViewBuilder {
    public static func buildLimitedAvailability<Content>(_ content: Content) -> Content where Content : View {
        return content
    }
}

extension ViewBuilder {
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> Tuple2View<C0, C1> where C0 : View, C1 : View {
        return Tuple2View((c0, c1))
    }

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> Tuple3View<C0, C1, C2> where C0 : View, C1 : View, C2 : View {
        return Tuple3View((c0, c1, c2))
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> Tuple4View<C0, C1, C2, C3> where C0 : View, C1 : View, C2 : View, C3 : View {
        return Tuple4View((c0, c1, c2, c3))
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> Tuple5View<C0, C1, C2, C3, C4> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View {
        return Tuple5View((c0, c1, c2, c3, c4))
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> Tuple6View<C0, C1, C2, C3, C4, C5> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View {
        return Tuple6View((c0, c1, c2, c3, c4, c5))
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> Tuple7View<C0, C1, C2, C3, C4, C5, C6> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View {
        return Tuple7View((c0, c1, c2, c3, c4, c5, c6))
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> Tuple8View<C0, C1, C2, C3, C4, C5, C6, C7> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View {
        return Tuple8View((c0, c1, c2, c3, c4, c5, c6, c7))
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> Tuple9View<C0, C1, C2, C3, C4, C5, C6, C7, C8> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View {
        return Tuple9View((c0, c1, c2, c3, c4, c5, c6, c7, c8))
    }
}
