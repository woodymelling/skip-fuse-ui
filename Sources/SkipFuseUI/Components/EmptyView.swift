// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipBridge
import SkipUI

public struct EmptyView: View {
    public init() {
    }

    public typealias Body = Never
}

extension EmptyView: Sendable {
}

#if os(Android)
extension EmptyView: SkipUIBridging {
    public var Java_view: JavaObjectPointer? {
        return SkipUI.EmptyView().toJavaObject(options: [])
    }
}
#endif
