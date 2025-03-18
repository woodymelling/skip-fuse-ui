// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipUI

public protocol TupleView {
    var skipUIBridgingViews: [SkipUIBridging?] { get }
}

extension TupleView {
    public var Java_view: any SkipUI.View {
        let javaViews = skipUIBridgingViews.compactMap { $0?.Java_view }
        return SkipUI.ComposeBuilder(bridgedViews: javaViews)
    }
}

public struct Tuple2View<V0, V1> : View, TupleView where V0 : View, V1 : View {
    let content: (V0, V1)

    public init(_ content: (V0, V1)) {
        self.content = content
    }

    public typealias Body = Never

    public var skipUIBridgingViews: [SkipUIBridging?] {
        return [content.0 as? SkipUIBridging, content.1 as? SkipUIBridging]
    }
}

#if os(Android)
extension Tuple2View : SkipUIBridging {}
#endif

public struct Tuple3View<V0, V1, V2> : View, TupleView where V0 : View, V1 : View, V2 : View {
    let content: (V0, V1, V2)

    public init(_ content: (V0, V1, V2)) {
        self.content = content
    }

    public typealias Body = Never

    public var skipUIBridgingViews: [SkipUIBridging?] {
        return [content.0 as? SkipUIBridging, content.1 as? SkipUIBridging, content.2 as? SkipUIBridging]
    }
}

#if os(Android)
extension Tuple3View : SkipUIBridging {}
#endif

public struct Tuple4View<V0, V1, V2, V3> : View, TupleView where V0 : View, V1 : View, V2 : View, V3 : View {
    let content: (V0, V1, V2, V3)

    public init(_ content: (V0, V1, V2, V3)) {
        self.content = content
    }

    public typealias Body = Never

    public var skipUIBridgingViews: [SkipUIBridging?] {
        return [content.0 as? SkipUIBridging, content.1 as? SkipUIBridging, content.2 as? SkipUIBridging, content.3 as? SkipUIBridging]
    }
}

#if os(Android)
extension Tuple4View : SkipUIBridging {}
#endif

public struct Tuple5View<V0, V1, V2, V3, V4> : View, TupleView where V0 : View, V1 : View, V2 : View, V3 : View, V4 : View {
    let content: (V0, V1, V2, V3, V4)

    public init(_ content: (V0, V1, V2, V3, V4)) {
        self.content = content
    }

    public typealias Body = Never

    public var skipUIBridgingViews: [SkipUIBridging?] {
        return [content.0 as? SkipUIBridging, content.1 as? SkipUIBridging, content.2 as? SkipUIBridging, content.3 as? SkipUIBridging, content.4 as? SkipUIBridging]
    }
}

#if os(Android)
extension Tuple5View : SkipUIBridging {}
#endif

public struct Tuple6View<V0, V1, V2, V3, V4, V5> : View, TupleView where V0 : View, V1 : View, V2 : View, V3 : View, V4 : View, V5 : View {
    let content: (V0, V1, V2, V3, V4, V5)

    public init(_ content: (V0, V1, V2, V3, V4, V5)) {
        self.content = content
    }

    public typealias Body = Never

    public var skipUIBridgingViews: [SkipUIBridging?] {
        return [content.0 as? SkipUIBridging, content.1 as? SkipUIBridging, content.2 as? SkipUIBridging, content.3 as? SkipUIBridging, content.4 as? SkipUIBridging, content.5 as? SkipUIBridging]
    }
}

#if os(Android)
extension Tuple6View : SkipUIBridging {}
#endif

public struct Tuple7View<V0, V1, V2, V3, V4, V5, V6> : View, TupleView where V0 : View, V1 : View, V2 : View, V3 : View, V4 : View, V5 : View, V6 : View {
    let content: (V0, V1, V2, V3, V4, V5, V6)

    public init(_ content: (V0, V1, V2, V3, V4, V5, V6)) {
        self.content = content
    }

    public typealias Body = Never

    public var skipUIBridgingViews: [SkipUIBridging?] {
        return [content.0 as? SkipUIBridging, content.1 as? SkipUIBridging, content.2 as? SkipUIBridging, content.3 as? SkipUIBridging, content.4 as? SkipUIBridging, content.5 as? SkipUIBridging, content.6 as? SkipUIBridging]
    }
}

#if os(Android)
extension Tuple7View : SkipUIBridging {}
#endif

public struct Tuple8View<V0, V1, V2, V3, V4, V5, V6, V7> : View, TupleView where V0 : View, V1 : View, V2 : View, V3 : View, V4 : View, V5 : View, V6 : View, V7 : View {
    let content: (V0, V1, V2, V3, V4, V5, V6, V7)

    public init(_ content: (V0, V1, V2, V3, V4, V5, V6, V7)) {
        self.content = content
    }

    public typealias Body = Never

    public var skipUIBridgingViews: [SkipUIBridging?] {
        return [content.0 as? SkipUIBridging, content.1 as? SkipUIBridging, content.2 as? SkipUIBridging, content.3 as? SkipUIBridging, content.4 as? SkipUIBridging, content.5 as? SkipUIBridging, content.6 as? SkipUIBridging, content.7 as? SkipUIBridging]
    }
}

#if os(Android)
extension Tuple8View : SkipUIBridging {}
#endif

public struct Tuple9View<V0, V1, V2, V3, V4, V5, V6, V7, V8> : View, TupleView where V0 : View, V1 : View, V2 : View, V3 : View, V4 : View, V5 : View, V6 : View, V7 : View, V8 : View {
    let content: (V0, V1, V2, V3, V4, V5, V6, V7, V8)

    public init(_ content: (V0, V1, V2, V3, V4, V5, V6, V7, V8)) {
        self.content = content
    }

    public typealias Body = Never

    public var skipUIBridgingViews: [SkipUIBridging?] {
        return [content.0 as? SkipUIBridging, content.1 as? SkipUIBridging, content.2 as? SkipUIBridging, content.3 as? SkipUIBridging, content.4 as? SkipUIBridging, content.5 as? SkipUIBridging, content.6 as? SkipUIBridging, content.7 as? SkipUIBridging, content.8 as? SkipUIBridging]
    }
}

#if os(Android)
extension Tuple9View : SkipUIBridging {}
#endif
