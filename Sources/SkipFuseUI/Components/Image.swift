// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import Foundation
import SkipAndroidBridge
import SkipUI

/* @frozen */ public struct Image : Equatable /*, Sendable */ {
    let spec: ImageSpec

    fileprivate init(spec: ImageSpec) {
        self.spec = spec
    }

    public static func ==(lhs: Image, rhs: Image) -> Bool {
        return lhs.spec == rhs.spec
    }
}

/// Define an image.
struct ImageSpec : Equatable {
    var name: String
    var bundle: AndroidBundle?
    var label: Text?
    var system = false
    var decorative = false
    var resizingMode: Image.ResizingMode?
}

extension Image : View {
    public typealias Body = Never
}

extension Image : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        //~~~
    }
}

extension Image {
    public enum ResizingMode : Int, Hashable /* , Sendable */ {
        case tile = 0 // For bridging
        case stretch = 1 // For bridging
    }

    // public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image
    public func resizable() -> Image {
        var spec = self.spec
        spec.resizingMode = .stretch
        return Image(spec: spec)
    }
    @available(*, unavailable)
    public func resizable(capInsets: EdgeInsets) -> Image {
        fatalError()
    }
    @available(*, unavailable)
    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode) -> Image {
        fatalError()
    }
}

extension Image {
    @frozen public enum Orientation : UInt8, CaseIterable, Hashable {
        case up
        case upMirrored
        case down
        case downMirrored
        case left
        case leftMirrored
        case right
        case rightMirrored
    }
}

extension Image {
    public enum Interpolation : Hashable /*, Sendable */ {
        case none
        case low
        case medium
        case high
    }
}

extension Image {
    public func interpolation(_ interpolation: Image.Interpolation) -> Image {
        return self
    }

    public func antialiased(_ isAntialiased: Bool) -> Image {
        return self
    }
}

extension Image {
    @available(*, unavailable)
    public func symbolRenderingMode(_ mode: SymbolRenderingMode?) -> Image {
        fatalError()
    }
}

extension Image {
    @available(*, unavailable)
    public init(_ cgImage: Any /* CGImage */, scale: CGFloat, orientation: Image.Orientation = .up, label: Text) {
        fatalError()
    }

    @available(*, unavailable)
    public init(decorative cgImage: Any /* CGImage */, scale: CGFloat, orientation: Image.Orientation = .up) {
        fatalError()
    }
}

extension Image {
    @available(*, unavailable)
    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image {
        fatalError()
    }
}

extension Image {
    public init(_ name: String, bundle: AndroidBundle? = nil) {
        self.init(spec: ImageSpec(name: name, bundle: bundle))
    }

    public init(_ name: String, bundle: AndroidBundle? = nil, label: Text) {
        self.init(spec: ImageSpec(name: name, bundle: bundle, label: label))
    }

    public init(decorative name: String, bundle: AndroidBundle? = nil) {
        self.init(spec: ImageSpec(name: name, bundle: bundle, decorative: true))
    }

    public init(systemName: String) {
        self.init(spec: ImageSpec(name: systemName, system: true))
    }
}

extension Image {
    @available(*, unavailable)
    public init(systemName: String, variableValue: Double?) {
        fatalError()
    }

    @available(*, unavailable)
    public init(_ name: String, variableValue: Double?, bundle: AndroidBundle? = nil) {
        fatalError()
    }

    @available(*, unavailable)
    public init(_ name: String, variableValue: Double?, bundle: AndroidBundle? = nil, label: Text) {
        fatalError()
    }

    @available(*, unavailable)
    public init(decorative name: String, variableValue: Double?, bundle: AndroidBundle? = nil) {
        fatalError()
    }
}

//@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
//extension Image {
//    public init(_ resource: ImageResource)
//}

extension Image {
    public struct DynamicRange : Hashable /* , Sendable */ {
        public static let standard = DynamicRange()
        public static let constrainedHigh = DynamicRange()
        public static let high = DynamicRange()
    }

    public func allowedDynamicRange(_ range: Image.DynamicRange?) -> Image {
        return self
    }
}

extension Image {
    @available(*, unavailable)
    public init(size: CGSize, label: Text? = nil, opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, renderer: @escaping (inout Any /* GraphicsContext */) -> Void) {
        fatalError()
    }
}

extension Image {
    public enum TemplateRenderingMode : Hashable /*, Sendable */ {
        case template
        case original
    }

    public enum Scale : Hashable /*, Sendable */ {
        case small
        case medium
        case large
    }
}
