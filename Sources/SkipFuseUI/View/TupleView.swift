// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

public protocol TupleView {
//    var composeIntegratingViews: [ComposeIntegrating] { get }
}

extension TupleView {
    // TODO: Make this implement ComposeBridging via skip.ui.VStack?
}

public struct Tuple2View<V0, V1>: View, TupleView where V0: View, V1: View {
    let content: (V0, V1)

    public init(_ content: (V0, V1)) {
        self.content = content
    }

    public typealias Body = Never

//    public var composeIntegratingViews: [any ComposeIntegrating] {
//        return [content.0, content.1]
//    }
}

public struct Tuple3View<V0, V1, V2>: View, TupleView where V0: View, V1: View, V2: View {
    let content: (V0, V1, V2)

    public init(_ content: (V0, V1, V2)) {
        self.content = content
    }

    public typealias Body = Never
//
//    public var composeIntegratingViews: [any ComposeIntegrating] {
//        return [content.0, content.1, content.2]
//    }
}

public struct Tuple4View<V0, V1, V2, V3>: View, TupleView where V0: View, V1: View, V2: View, V3: View {
    let content: (V0, V1, V2, V3)

    public init(_ content: (V0, V1, V2, V3)) {
        self.content = content
    }

    public typealias Body = Never

//    public var composeIntegratingViews: [any ComposeIntegrating] {
//        return [content.0, content.1, content.2, content.3]
//    }
}

public struct Tuple5View<V0, V1, V2, V3, V4>: View, TupleView where V0: View, V1: View, V2: View, V3: View, V4: View {
    let content: (V0, V1, V2, V3, V4)

    public init(_ content: (V0, V1, V2, V3, V4)) {
        self.content = content
    }

    public typealias Body = Never

//    public var composeIntegratingViews: [any ComposeIntegrating] {
//        return [content.0, content.1, content.2, content.3, content.4]
//    }
}

public struct Tuple6View<V0, V1, V2, V3, V4, V5>: View, TupleView where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View {
    let content: (V0, V1, V2, V3, V4, V5)

    public init(_ content: (V0, V1, V2, V3, V4, V5)) {
        self.content = content
    }

    public typealias Body = Never

//    public var composeIntegratingViews: [any ComposeIntegrating] {
//        return [content.0, content.1, content.2, content.3, content.4, content.5]
//    }
}

public struct Tuple7View<V0, V1, V2, V3, V4, V5, V6>: View, TupleView where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View {
    let content: (V0, V1, V2, V3, V4, V5, V6)

    public init(_ content: (V0, V1, V2, V3, V4, V5, V6)) {
        self.content = content
    }

    public typealias Body = Never

//    public var composeIntegratingViews: [any ComposeIntegrating] {
//        return [content.0, content.1, content.2, content.3, content.4, content.5, content.6]
//    }
}

public struct Tuple8View<V0, V1, V2, V3, V4, V5, V6, V7>: View, TupleView where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View, V7: View {
    let content: (V0, V1, V2, V3, V4, V5, V6, V7)

    public init(_ content: (V0, V1, V2, V3, V4, V5, V6, V7)) {
        self.content = content
    }

    public typealias Body = Never

//    public var composeIntegratingViews: [any ComposeIntegrating] {
//        return [content.0, content.1, content.2, content.3, content.4, content.5, content.6, content.7]
//    }
}

public struct Tuple9View<V0, V1, V2, V3, V4, V5, V6, V7, V8>: View, TupleView where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View, V7: View, V8: View {
    let content: (V0, V1, V2, V3, V4, V5, V6, V7, V8)

    public init(_ content: (V0, V1, V2, V3, V4, V5, V6, V7, V8)) {
        self.content = content
    }

    public typealias Body = Never

//    public var composeIntegratingViews: [any ComposeIntegrating] {
//        return [content.0, content.1, content.2, content.3, content.4, content.5, content.6, content.7, content.8]
//    }
}
