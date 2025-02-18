// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipUI

public protocol ShapeStyle /* : Sendable */ {
    var spec: /* @Sendable */ () -> ShapeStyleBridgeSpec { get }

//    /// The type of shape style this will resolve to.
//    ///
//    /// When you create a custom shape style, Swift infers this type
//    /// from your implementation of the required `resolve` function.
//    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
//    associatedtype Resolved : ShapeStyle = Never
//
//    /// Evaluate to a resolved shape style given the current `environment`.
//    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
//    func resolve(in environment: EnvironmentValues) -> Self.Resolved
}

@frozen public struct HierarchicalShapeStyle : ShapeStyle {
    public let spec: /* @Sendable */ () -> ShapeStyleBridgeSpec

    public init(spec: /* @Sendable */ @escaping () -> ShapeStyleBridgeSpec) {
        self.spec = spec
    }

    public static let primary = HierarchicalShapeStyle(spec: { .color(.primary) })
    public static let secondary = HierarchicalShapeStyle(spec: { .color(.secondary) })

    @available(*, unavailable)
    public static var tertiary: HierarchicalShapeStyle { fatalError() }
    @available(*, unavailable)
    public static var quaternary: HierarchicalShapeStyle { fatalError() }
}

extension ShapeStyle where Self == HierarchicalShapeStyle {
    public static var primary: HierarchicalShapeStyle { HierarchicalShapeStyle.primary }
    public static var secondary: HierarchicalShapeStyle { HierarchicalShapeStyle.secondary }

    @available(*, unavailable)
    public static var tertiary: HierarchicalShapeStyle { fatalError() }
    @available(*, unavailable)
    public static var quaternary: HierarchicalShapeStyle { fatalError() }
}

// TODO: Incorporate
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ShapeStyle where Self == LinearGradient {
//
//    /// A linear gradient.
//    ///
//    /// The gradient applies the color function along an axis, as defined by its
//    /// start and end points. The gradient maps the unit space points into the
//    /// bounding rectangle of each shape filled with the gradient.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func linearGradient(_ gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint) -> LinearGradient
//
//    /// A linear gradient defined by a collection of colors.
//    ///
//    /// The gradient applies the color function along an axis, as defined by its
//    /// start and end points. The gradient maps the unit space points into the
//    /// bounding rectangle of each shape filled with the gradient.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func linearGradient(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> LinearGradient
//
//    /// A linear gradient defined by a collection of color stops.
//    ///
//    /// The gradient applies the color function along an axis, as defined by its
//    /// start and end points. The gradient maps the unit space points into the
//    /// bounding rectangle of each shape filled with the gradient.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func linearGradient(stops: [Gradient.Stop], startPoint: UnitPoint, endPoint: UnitPoint) -> LinearGradient
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ShapeStyle where Self == RadialGradient {
//
//    /// A radial gradient.
//    ///
//    /// The gradient applies the color function as the distance from a center
//    /// point, scaled to fit within the defined start and end radii. The
//    /// gradient maps the unit space center point into the bounding rectangle of
//    /// each shape filled with the gradient.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func radialGradient(_ gradient: Gradient, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) -> RadialGradient
//
//    /// A radial gradient defined by a collection of colors.
//    ///
//    /// The gradient applies the color function as the distance from a center
//    /// point, scaled to fit within the defined start and end radii. The
//    /// gradient maps the unit space center point into the bounding rectangle of
//    /// each shape filled with the gradient.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func radialGradient(colors: [Color], center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) -> RadialGradient
//
//    /// A radial gradient defined by a collection of color stops.
//    ///
//    /// The gradient applies the color function as the distance from a center
//    /// point, scaled to fit within the defined start and end radii. The
//    /// gradient maps the unit space center point into the bounding rectangle of
//    /// each shape filled with the gradient.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func radialGradient(stops: [Gradient.Stop], center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) -> RadialGradient
//}
//
//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//extension ShapeStyle where Self == EllipticalGradient {
//
//    /// A radial gradient that draws an ellipse.
//    ///
//    /// The gradient maps its coordinate space to the unit space square
//    /// in which its center and radii are defined, then stretches that
//    /// square to fill its bounding rect, possibly also stretching the
//    /// circular gradient to have elliptical contours.
//    ///
//    /// For example, an elliptical gradient used as a background:
//    ///
//    ///     let gradient = Gradient(colors: [.red, .yellow])
//    ///
//    ///     ContentView()
//    ///         .background(.ellipticalGradient(gradient))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func ellipticalGradient(_ gradient: Gradient, center: UnitPoint = .center, startRadiusFraction: CGFloat = 0, endRadiusFraction: CGFloat = 0.5) -> EllipticalGradient
//
//    /// A radial gradient that draws an ellipse defined by a collection of
//    /// colors.
//    ///
//    /// The gradient maps its coordinate space to the unit space square
//    /// in which its center and radii are defined, then stretches that
//    /// square to fill its bounding rect, possibly also stretching the
//    /// circular gradient to have elliptical contours.
//    ///
//    /// For example, an elliptical gradient used as a background:
//    ///
//    ///     .background(.elliptical(colors: [.red, .yellow]))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func ellipticalGradient(colors: [Color], center: UnitPoint = .center, startRadiusFraction: CGFloat = 0, endRadiusFraction: CGFloat = 0.5) -> EllipticalGradient
//
//    /// A radial gradient that draws an ellipse defined by a collection of
//    /// color stops.
//    ///
//    /// The gradient maps its coordinate space to the unit space square
//    /// in which its center and radii are defined, then stretches that
//    /// square to fill its bounding rect, possibly also stretching the
//    /// circular gradient to have elliptical contours.
//    ///
//    /// For example, an elliptical gradient used as a background:
//    ///
//    ///     .background(.ellipticalGradient(stops: [
//    ///         .init(color: .red, location: 0.0),
//    ///         .init(color: .yellow, location: 0.9),
//    ///         .init(color: .yellow, location: 1.0),
//    ///     ]))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func ellipticalGradient(stops: [Gradient.Stop], center: UnitPoint = .center, startRadiusFraction: CGFloat = 0, endRadiusFraction: CGFloat = 0.5) -> EllipticalGradient
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ShapeStyle where Self == AngularGradient {
//
//    /// An angular gradient, which applies the color function as the angle
//    /// changes between the start and end angles, and anchored to a relative
//    /// center point within the filled shape.
//    ///
//    /// An angular gradient is also known as a "conic" gradient. If
//    /// `endAngle - startAngle > 2π`, the gradient only draws the last complete
//    /// turn. If `endAngle - startAngle < 2π`, the gradient fills the missing
//    /// area with the colors defined by gradient stop locations at `0` and `1`,
//    /// transitioning between the two halfway across the missing area.
//    ///
//    /// For example, an angular gradient used as a background:
//    ///
//    ///     let gradient = Gradient(colors: [.red, .yellow])
//    ///
//    ///     ContentView()
//    ///         .background(.angularGradient(gradient))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    ///
//    /// - Parameters:
//    ///   - gradient: The gradient to use for filling the shape, providing the
//    ///     colors and their relative stop locations.
//    ///   - center: The relative center of the gradient, mapped from the unit
//    ///     space into the bounding rectangle of the filled shape.
//    ///   - startAngle: The angle that marks the beginning of the gradient.
//    ///   - endAngle: The angle that marks the end of the gradient.
//    public static func angularGradient(_ gradient: Gradient, center: UnitPoint, startAngle: Angle, endAngle: Angle) -> AngularGradient
//
//    /// An angular gradient defined by a collection of colors.
//    ///
//    /// For more information on how to use angular gradients, see
//    /// ``ShapeStyle/angularGradient(_:center:startAngle:endAngle:)``.
//    ///
//    /// - Parameters:
//    ///   - colors: The colors of the gradient, evenly spaced along its full
//    ///     length.
//    ///   - center: The relative center of the gradient, mapped from the unit
//    ///     space into the bounding rectangle of the filled shape.
//    ///   - startAngle: The angle that marks the beginning of the gradient.
//    ///   - endAngle: The angle that marks the end of the gradient.
//    public static func angularGradient(colors: [Color], center: UnitPoint, startAngle: Angle, endAngle: Angle) -> AngularGradient
//
//    /// An angular gradient defined by a collection of color stops.
//    ///
//    /// For more information on how to use angular gradients, see
//    /// ``ShapeStyle/angularGradient(_:center:startAngle:endAngle:)``.
//    ///
//    /// - Parameters:
//    ///   - stops: The color stops of the gradient, defining each component
//    ///     color and their relative location along the gradient's full length.
//    ///   - center: The relative center of the gradient, mapped from the unit
//    ///     space into the bounding rectangle of the filled shape.
//    ///   - startAngle: The angle that marks the beginning of the gradient.
//    ///   - endAngle: The angle that marks the end of the gradient.
//    public static func angularGradient(stops: [Gradient.Stop], center: UnitPoint, startAngle: Angle, endAngle: Angle) -> AngularGradient
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ShapeStyle where Self == AngularGradient {
//
//    /// A conic gradient that completes a full turn, optionally starting from
//    /// a given angle and anchored to a relative center point within the filled
//    /// shape.
//    ///
//    /// For example, a conic gradient used as a background:
//    ///
//    ///     let gradient = Gradient(colors: [.red, .yellow])
//    ///
//    ///     ContentView()
//    ///         .background(.conicGradient(gradient))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    ///
//    /// - Parameters:
//    ///   - gradient: The gradient to use for filling the shape, providing the
//    ///     colors and their relative stop locations.
//    ///   - center: The relative center of the gradient, mapped from the unit
//    ///     space into the bounding rectangle of the filled shape.
//    ///   - angle: The angle to offset the beginning of the gradient's full
//    ///     turn.
//    public static func conicGradient(_ gradient: Gradient, center: UnitPoint, angle: Angle = .zero) -> AngularGradient
//
//    /// A conic gradient defined by a collection of colors that completes a full
//    /// turn.
//    ///
//    /// For more information on how to use conic gradients, see
//    /// ``ShapeStyle/conicGradient(_:center:angle:)``.
//    ///
//    /// - Parameters:
//    ///   - colors: The colors of the gradient, evenly spaced along its full
//    ///     length.
//    ///   - center: The relative center of the gradient, mapped from the unit
//    ///     space into the bounding rectangle of the filled shape.
//    ///   - angle: The angle to offset the beginning of the gradient's full
//    ///     turn.
//    public static func conicGradient(colors: [Color], center: UnitPoint, angle: Angle = .zero) -> AngularGradient
//
//    /// A conic gradient defined by a collection of color stops that completes a
//    /// full turn.
//    ///
//    /// For more information on how to use conic gradients, see
//    /// ``ShapeStyle/conicGradient(_:center:angle:)``.
//    ///
//    /// - Parameters:
//    ///   - stops: The color stops of the gradient, defining each component
//    ///     color and their relative location along the gradient's full length.
//    ///   - center: The relative center of the gradient, mapped from the unit
//    ///     space into the bounding rectangle of the filled shape.
//    ///   - angle: The angle to offset the beginning of the gradient's full
//    ///     turn.
//    public static func conicGradient(stops: [Gradient.Stop], center: UnitPoint, angle: Angle = .zero) -> AngularGradient
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension ShapeStyle where Self == LinearGradient {
//
//    /// A linear gradient.
//    ///
//    /// The gradient applies the color function along an axis, as
//    /// defined by its start and end points. The gradient maps the unit
//    /// space points into the bounding rectangle of each shape filled
//    /// with the gradient.
//    ///
//    /// For example, a linear gradient used as a background:
//    ///
//    ///     ContentView()
//    ///         .background(.linearGradient(.red.gradient,
//    ///             startPoint: .top, endPoint: .bottom))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func linearGradient(_ gradient: AnyGradient, startPoint: UnitPoint, endPoint: UnitPoint) -> some ShapeStyle
//
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension ShapeStyle where Self == RadialGradient {
//
//    /// A radial gradient.
//    ///
//    /// The gradient applies the color function as the distance from a
//    /// center point, scaled to fit within the defined start and end
//    /// radii. The gradient maps the unit space center point into the
//    /// bounding rectangle of each shape filled with the gradient.
//    ///
//    /// For example, a radial gradient used as a background:
//    ///
//    ///     ContentView()
//    ///         .background(.radialGradient(.red.gradient, endRadius: 100))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func radialGradient(_ gradient: AnyGradient, center: UnitPoint = .center, startRadius: CGFloat = 0, endRadius: CGFloat) -> some ShapeStyle
//
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension ShapeStyle where Self == EllipticalGradient {
//
//    /// A radial gradient that draws an ellipse.
//    ///
//    /// The gradient maps its coordinate space to the unit space square
//    /// in which its center and radii are defined, then stretches that
//    /// square to fill its bounding rect, possibly also stretching the
//    /// circular gradient to have elliptical contours.
//    ///
//    /// For example, an elliptical gradient used as a background:
//    ///
//    ///     ContentView()
//    ///         .background(.ellipticalGradient(.red.gradient))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static func ellipticalGradient(_ gradient: AnyGradient, center: UnitPoint = .center, startRadiusFraction: CGFloat = 0, endRadiusFraction: CGFloat = 0.5) -> some ShapeStyle
//
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension ShapeStyle where Self == AngularGradient {
//
//    /// An angular gradient, which applies the color function as the
//    /// angle changes between the start and end angles, and anchored to
//    /// a relative center point within the filled shape.
//    ///
//    /// An angular gradient is also known as a "conic" gradient. If
//    /// `endAngle - startAngle > 2π`, the gradient only draws the last complete
//    /// turn. If `endAngle - startAngle < 2π`, the gradient fills the missing
//    /// area with the colors defined by gradient stop locations at `0` and `1`,
//    /// transitioning between the two halfway across the missing area.
//    ///
//    /// For example, an angular gradient used as a background:
//    ///
//    ///     ContentView()
//    ///         .background(.angularGradient(.red.gradient))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    ///
//    /// - Parameters:
//    ///   - gradient: The gradient to use for filling the shape, providing the
//    ///     colors and their relative stop locations.
//    ///   - center: The relative center of the gradient, mapped from the unit
//    ///     space into the bounding rectangle of the filled shape.
//    ///   - startAngle: The angle that marks the beginning of the gradient.
//    ///   - endAngle: The angle that marks the end of the gradient.
//    public static func angularGradient(_ gradient: AnyGradient, center: UnitPoint = .center, startAngle: Angle, endAngle: Angle) -> some ShapeStyle
//
//
//    /// A conic gradient that completes a full turn, optionally starting from
//    /// a given angle and anchored to a relative center point within the filled
//    /// shape.
//    ///
//    /// For example, a conic gradient used as a background:
//    ///
//    ///     let gradient = Gradient(colors: [.red, .yellow])
//    ///
//    ///     ContentView()
//    ///         .background(.conicGradient(gradient))
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    ///
//    /// - Parameters:
//    ///   - gradient: The gradient to use for filling the shape, providing the
//    ///     colors and their relative stop locations.
//    ///   - center: The relative center of the gradient, mapped from the unit
//    ///     space into the bounding rectangle of the filled shape.
//    ///   - angle: The angle to offset the beginning of the gradient's full
//    ///     turn.
//    public static func conicGradient(_ gradient: AnyGradient, center: UnitPoint = .center, angle: Angle = .zero) -> some ShapeStyle
//
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ShapeStyle where Self == ImagePaint {
//
//    /// A shape style that fills a shape by repeating a region of an image.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    ///
//    /// - Parameters:
//    ///   - image: The image to be drawn.
//    ///   - sourceRect: A unit-space rectangle defining how much of the source
//    ///     image to draw. The results are undefined if `sourceRect` selects
//    ///     areas outside the `[0, 1]` range in either axis.
//    ///   - scale: A scale factor applied to the image during rendering.
//    public static func image(_ image: Image, sourceRect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1), scale: CGFloat = 1) -> ImagePaint
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension ShapeStyle where Self == AnyShapeStyle {
//
//    /// Returns a new style based on the current style that multiplies
//    /// by `opacity` when drawing.
//    ///
//    /// In most contexts the current style is the foreground but e.g.
//    /// when setting the value of the background style, that becomes
//    /// the current implicit style.
//    ///
//    /// For example, a circle filled with the current foreground
//    /// style at fifty-percent opacity:
//    ///
//    ///     Circle().fill(.opacity(0.5))
//    ///
//    public static func opacity(_ opacity: Double) -> some ShapeStyle
//
//}
//
//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//extension ShapeStyle {
//
//    /// Returns a new style based on `self` that applies the specified
//    /// blend mode when drawing.
//    @inlinable public func blendMode(_ mode: BlendMode) -> some ShapeStyle
//
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension ShapeStyle where Self == AnyShapeStyle {
//
//    /// Returns a new style based on the current style that uses
//    /// `mode` as its blend mode when drawing.
//    ///
//    /// In most contexts the current style is the foreground but e.g.
//    /// when setting the value of the background style, that becomes
//    /// the current implicit style.
//    ///
//    /// For example, a circle filled with the current foreground
//    /// style and the overlay blend mode:
//    ///
//    ///     Circle().fill(.blendMode(.overlay))
//    ///
//    public static func blendMode(_ mode: BlendMode) -> some ShapeStyle
//
//}
//
//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 10.0, *)
//extension ShapeStyle where Self == Material {
//
//    /// A material that's somewhat translucent.
//    public static var regularMaterial: Material { get }
//
//    /// A material that's more opaque than translucent.
//    public static var thickMaterial: Material { get }
//
//    /// A material that's more translucent than opaque.
//    public static var thinMaterial: Material { get }
//
//    /// A mostly translucent material.
//    public static var ultraThinMaterial: Material { get }
//
//    /// A mostly opaque material.
//    public static var ultraThickMaterial: Material { get }
//}
//
//@available(iOS 15.0, macOS 12.0, *)
//@available(tvOS, unavailable)
//@available(watchOS, unavailable)
//extension ShapeStyle where Self == Material {
//
//    /// A material matching the style of system toolbars.
//    public static var bar: Material { get }
//}
//
//@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
//extension ShapeStyle {
//
//    /// Sets an explicit active appearance for materials created by this style.
//    public func materialActiveAppearance(_ appearance: MaterialActiveAppearance) -> some ShapeStyle
//
//}
//
//
//@available(iOS 16.0, macOS 12.0, macCatalyst 15.0, tvOS 17.0, watchOS 10.0, *)
//extension ShapeStyle where Self == HierarchicalShapeStyle {
//
//    /// A shape style that maps to the fifth level of the current content
//    /// style.
//    ///
//    /// This hierarchical style maps to the fifth level of the current
//    /// foreground style, or to the fifth level of the default foreground style
//    /// if you haven't set a foreground style in the view's environment. You
//    /// typically set a foreground style by supplying a non-hierarchical style
//    /// to the ``View/foregroundStyle(_:)`` modifier.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static var quinary: HierarchicalShapeStyle { get }
//}
//
//@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
//extension ShapeStyle {
//
//    /// Returns the second level of this shape style.
//    public var secondary: some ShapeStyle { get }
//
//    /// Returns the third level of this shape style.
//    public var tertiary: some ShapeStyle { get }
//
//    /// Returns the fourth level of this shape style.
//    public var quaternary: some ShapeStyle { get }
//
//    /// Returns the fifth level of this shape style.
//    public var quinary: some ShapeStyle { get }
//}
//
//
//@available(iOS 17.0, macOS 10.15, tvOS 17.0, watchOS 10.0, *)
//extension ShapeStyle where Self == SeparatorShapeStyle {
//
//    /// A style appropriate for foreground separator or border lines.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static var separator: SeparatorShapeStyle { get }
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension ShapeStyle {
//
//    /// Applies the specified shadow effect to the shape style.
//    ///
//    /// For example, you can create a rectangle that adds a drop shadow to
//    /// the ``ShapeStyle/red`` shape style.
//    ///
//    ///     Rectangle().fill(.red.shadow(.drop(radius: 2, y: 3)))
//    ///
//    /// - Parameter style: The shadow style to apply.
//    ///
//    /// - Returns: A new shape style that uses the specified shadow style.
//    @inlinable public func shadow(_ style: ShadowStyle) -> some ShapeStyle
//
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension ShapeStyle where Self == AnyShapeStyle {
//
//    /// Returns a shape style that applies the specified shadow style to the
//    /// current style.
//    ///
//    /// In most contexts the current style is the foreground, but not always.
//    /// For example, when setting the value of the background style, that
//    /// becomes the current implicit style.
//    ///
//    /// The following example creates a circle filled with the current
//    /// foreground style that uses an inner shadow:
//    ///
//    ///     Circle().fill(.shadow(.inner(radius: 1, y: 1)))
//    ///
//    /// - Parameter style: The shadow style to apply.
//    ///
//    /// - Returns: A new shape style based on the current style that uses the
//    ///   specified shadow style.
//    public static func shadow(_ style: ShadowStyle) -> some ShapeStyle
//
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ShapeStyle {
//
//    /// Maps a shape style's unit-space coordinates to the absolute coordinates
//    /// of a given rectangle.
//    ///
//    /// Some shape styles have colors or patterns that vary
//    /// with position based on ``UnitPoint`` coordinates. For example, you
//    /// can create a ``LinearGradient`` using ``UnitPoint/top`` and
//    /// ``UnitPoint/bottom`` as the start and end points:
//    ///
//    ///     let gradient = LinearGradient(
//    ///         colors: [.red, .yellow],
//    ///         startPoint: .top,
//    ///         endPoint: .bottom)
//    ///
//    /// When rendering such styles, SwiftUI maps the unit space coordinates to
//    /// the absolute coordinates of the filled shape. However, you can tell
//    /// SwiftUI to use a different set of coordinates by supplying a rectangle
//    /// to the `in(_:)` method. Consider two resizable rectangles using the
//    /// gradient defined above:
//    ///
//    ///     HStack {
//    ///         Rectangle()
//    ///             .fill(gradient)
//    ///         Rectangle()
//    ///             .fill(gradient.in(CGRect(x: 0, y: 0, width: 0, height: 300)))
//    ///     }
//    ///     .onTapGesture { isBig.toggle() }
//    ///     .frame(height: isBig ? 300 : 50)
//    ///     .animation(.easeInOut)
//    ///
//    /// When `isBig` is true — defined elsewhere as a private ``State``
//    /// variable — the rectangles look the same, because their heights
//    /// match that of the modified gradient:
//    ///
//    /// ![Two identical, tall rectangles, with a gradient that starts red at
//    /// the top and transitions to yellow at the bottom.](ShapeStyle-in-1)
//    ///
//    /// When the user toggles `isBig` by tapping the ``HStack``, the
//    /// rectangles shrink, but the gradients each react in a different way:
//    ///
//    /// ![Two short rectangles with different coloration. The first has a
//    /// gradient that transitions top to bottom from full red to full yellow.
//    /// The second starts as red at the top and then begins to transition
//    /// to yellow toward the bottom.](ShapeStyle-in-2)
//    ///
//    /// SwiftUI remaps the gradient of the first rectangle to the new frame
//    /// height, so that you continue to see the full range of colors in a
//    /// smaller area. For the second rectangle, the modified gradient retains
//    /// a mapping to the full height, so you instead see only a small part of
//    /// the overall gradient. Animation helps to visualize the difference.
//    ///
//    /// - Parameter rect: A rectangle that gives the absolute coordinates over
//    ///   which to map the shape style.
//    /// - Returns: A new shape style mapped to the coordinates given by `rect`.
//    @inlinable public func `in`(_ rect: CGRect) -> some ShapeStyle
//
//}
//
//@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
//extension ShapeStyle where Self == BackgroundStyle {
//
//    /// The background style in the current context.
//    ///
//    /// Access this value to get the style SwiftUI uses for the background
//    /// in the current context. The specific color that SwiftUI renders depends
//    /// on factors like the platform and whether the user has turned on Dark
//    /// Mode.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static var background: BackgroundStyle { get }
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ShapeStyle where Self == ForegroundStyle {
//
//    /// The foreground style in the current context.
//    ///
//    /// Access this value to get the style SwiftUI uses for foreground elements,
//    /// like text, symbols, and shapes, in the current context. Use the
//    /// ``View/foregroundStyle(_:)`` modifier to set a new foreground style for
//    /// a given view and its child views.
//    ///
//    /// For information about how to use shape styles, see ``ShapeStyle``.
//    public static var foreground: ForegroundStyle { get }
//}
//
//@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
//extension ShapeStyle where Self.Resolved == Never {
//
//    /// Evaluate to a resolved shape style given the current `environment`.
//    public func resolve(in environment: EnvironmentValues) -> Never
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ShapeStyle where Self : View, Self.Body == _ShapeView<Rectangle, Self> {
//
//    /// A rectangular view that's filled with the shape style.
//    ///
//    /// For a ``ShapeStyle`` that also conforms to the ``View`` protocol, like
//    /// ``Color`` or ``LinearGradient``, this default implementation of the
//    /// ``View/body-swift.property`` property provides a visual representation
//    /// for the shape style. As a result, you can use the shape style in a view
//    /// hierarchy like any other view:
//    ///
//    ///     ZStack {
//    ///         Color.cyan
//    ///         Text("Hello!")
//    ///     }
//    ///     .frame(width: 200, height: 50)
//    ///
//    /// ![A screenshot of a cyan rectangle with the text hello appearing
//    /// in the middle of the rectangle.](ShapeStyle-body-1)
//    public var body: _ShapeView<Rectangle, Self> { get }
//}
//
//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//extension ShapeStyle where Self == TintShapeStyle {
//
//    /// A style that reflects the current tint color.
//    ///
//    /// You can set the tint color with the `tint(_:)` modifier. If no explicit
//    /// tint is set, the tint is derived from the app's accent color.
//    public static var tint: TintShapeStyle { get }
//}
//
//
