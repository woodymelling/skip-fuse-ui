// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
#if !ROBOLECTRIC && canImport(CoreGraphics)
import CoreGraphics
#endif
import SkipUI

@frozen public struct Path : Equatable /*, LosslessStringConvertible, @unchecked Sendable */ {
    // Unlike our strategy with most components, we are keeping a reference to a SkipUI peer.
    // This is necessary to respond correctly to funcs like `contains`
    var Java_path: SkipUI.Path

    public init() {
        self.Java_path = SkipUI.Path()
    }

    init(Java_path: SkipUI.Path) {
        self.Java_path = Java_path
    }

//    public init(_ path: CGPath)
//
//    public init(_ path: CGMutablePath)

    public init(_ rect: CGRect) {
        self.init()
        addRect(rect)
    }

    public init(roundedRect rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .continuous) {
        self.init()
        addRoundedRect(in: rect, cornerSize: cornerSize, style: style)
    }

    public init(roundedRect rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous) {
        self.init()
        addRoundedRect(in: rect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius), style: style)
    }

    public init(roundedRect rect: CGRect, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous) {
        self.init()
        addRoundedRect(in: rect, cornerRadii: cornerRadii, style: style)
    }

    public init(ellipseIn rect: CGRect) {
        self.init()
        addEllipse(in: rect)
    }

    public init(_ callback: (inout Path) -> ()) {
        self.init()
        callback(&self)
    }

    @available(*, unavailable)
    public init?(_ string: String) {
        fatalError()
    }

    public var description: String {
        return "Path"
    }

    @available(*, unavailable)
    public var cgPath: Any /* CGPath */ {
        fatalError()
    }

    public var isEmpty: Bool {
        return Java_path.isEmpty
    }

    public var boundingRect: CGRect {
        let (x, y, width, height) = Java_path.bridgedBoundingRect
        return CGRect(x: x, y: y, width: width, height: height)
    }

    public func contains(_ p: CGPoint, eoFill: Bool = false) -> Bool {
        return Java_path.contains(x: p.x, y: p.y, eoFill: eoFill)
    }

    @frozen public enum Element : Equatable {
        case move(to: CGPoint)
        case line(to: CGPoint)
        case quadCurve(to: CGPoint, control: CGPoint)
        case curve(to: CGPoint, control1: CGPoint, control2: CGPoint)
        case closeSubpath
    }

    @available(*, unavailable)
    public func forEach(_ body: (Path.Element) -> Void) {
        fatalError()
    }

    @available(*, unavailable)
    public func strokedPath(_ style: StrokeStyle) -> Path {
        fatalError()
    }

    @available(*, unavailable)
    public func trimmedPath(from: CGFloat, to: CGFloat) -> Path {
        fatalError()
    }
}

extension Path : Shape {
    /* nonisolated */ public func path(in _: CGRect) -> Path {
        return self
    }

//    public typealias AnimatableData = EmptyAnimatableData

    public var Java_view: any SkipUI.View {
        return Java_path
    }
}

extension Path /* : BitwiseCopyable, Sendable */ {
    public mutating func move(to end: CGPoint) {
        Java_path = Java_path.copy()
        Java_path.move(toX: end.x, y: end.y)
    }

    public mutating func addLine(to end: CGPoint) {
        Java_path = Java_path.copy()
        Java_path.addLine(toX: end.x, y: end.y)
    }

    public mutating func addQuadCurve(to end: CGPoint, control: CGPoint) {
        Java_path = Java_path.copy()
        Java_path.addQuadCurve(toX: end.x, y: end.y, controlX: control.x, controlY: control.y)
    }

    public mutating func addCurve(to end: CGPoint, control1: CGPoint, control2: CGPoint) {
        Java_path = Java_path.copy()
        Java_path.addCurve(toX: end.x, y: end.y, control1X: control1.x, control1Y: control1.y, control2X: control2.x, control2Y: control2.y)
    }

    public mutating func closeSubpath() {
        Java_path = Java_path.copy()
        Java_path.closeSubpath()
    }

    public mutating func addRect(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        Java_path = Java_path.copy()
        Java_path.addRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height, a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty)
    }

    public mutating func addRoundedRect(in rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .continuous, transform: CGAffineTransform = .identity) {
        Java_path = Java_path.copy()
        Java_path.addRoundedRect(inX: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height, cornerWidth: cornerSize.width, cornerHeight: cornerSize.height, bridgedCornerStyle: style.rawValue, a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty)
    }

    public mutating func addRoundedRect(in rect: CGRect, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous, transform: CGAffineTransform = .identity) {
        Java_path = Java_path.copy()
        Java_path.addRoundedRect(inX: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height, topLeading: cornerRadii.topLeading, bottomLeading: cornerRadii.bottomLeading, bottomTrailing: cornerRadii.bottomTrailing, topTrailing: cornerRadii.topTrailing, bridgedCornerStyle: style.rawValue, a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty)
    }

    public mutating func addEllipse(in rect: CGRect, transform: CGAffineTransform = .identity) {
        Java_path = Java_path.copy()
        Java_path.addEllipse(inX: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height, a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty)
    }

    public mutating func addRects(_ rects: [CGRect], transform: CGAffineTransform = .identity) {
        rects.forEach { addRect($0) }
    }

    public mutating func addLines(_ lines: [CGPoint]) {
        if let first = lines.first {
            move(to: first)
        }
        for i in 1..<lines.count {
            addLine(to: lines[i])
        }
    }

    public mutating func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity) {
        Java_path = Java_path.copy()
        Java_path.addRelativeArc(centerX: center.x, y: center.y, radius: radius, startAngle: startAngle.radians, delta: delta.radians, a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty)
    }

    public mutating func addArc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool, transform: CGAffineTransform = .identity) {
        Java_path = Java_path.copy()
        Java_path.addArc(centerX: center.x, y: center.y, radius: radius, startAngle: startAngle.radians, endAngle: endAngle.radians, clockwise: clockwise, a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty)
    }

    @available(*, unavailable)
    public mutating func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat, transform: CGAffineTransform = .identity) {
        fatalError()
    }

    public mutating func addPath(_ path: Path, transform: CGAffineTransform = .identity) {
        Java_path = Java_path.copy()
        Java_path.addPath(path.Java_path, a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty)
    }

    @available(*, unavailable)
    public var currentPoint: CGPoint? {
        fatalError()
    }

    @available(*, unavailable)
    public func normalized(eoFill: Bool = true) -> Path {
        fatalError()
    }

    public func intersection(_ other: Path, eoFill: Bool = false) -> Path {
        return Path(Java_path: Java_path.intersection(other.Java_path, eoFill: eoFill))
    }

    public func union(_ other: Path, eoFill: Bool = false) -> Path {
        return Path(Java_path: Java_path.union(other.Java_path, eoFill: eoFill))
    }

    public func subtracting(_ other: Path, eoFill: Bool = false) -> Path {
        return Path(Java_path: Java_path.subtracting(other.Java_path, eoFill: eoFill))
    }

    public func symmetricDifference(_ other: Path, eoFill: Bool = false) -> Path {
        return Path(Java_path: Java_path.symmetricDifference(other.Java_path, eoFill: eoFill))
    }

    @available(*, unavailable)
    public func lineIntersection(_ other: Path, eoFill: Bool = false) -> Path {
        fatalError()
    }

    @available(*, unavailable)
    public func lineSubtraction(_ other: Path, eoFill: Bool = false) -> Path {
        fatalError()
    }

    public func applying(_ transform: CGAffineTransform) -> Path {
        return Path(Java_path: Java_path.applying(a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty))
    }

    public func offsetBy(dx: CGFloat, dy: CGFloat) -> Path {
        return Path(Java_path: Java_path.offsetBy(dx: dx, dy: dy))
    }
}
