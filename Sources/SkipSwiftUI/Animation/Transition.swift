// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
#if !ROBOLECTRIC && canImport(CoreGraphics)
import CoreGraphics
#endif
import SkipUI

/* @MainActor @preconcurrency */ public protocol Transition {
    associatedtype Body : View

    @ViewBuilder @MainActor /* @preconcurrency */ func body(content: Self.Content, phase: TransitionPhase) -> Self.Body

    /* @MainActor @preconcurrency */ static var properties: TransitionProperties { get }

//    typealias Content = PlaceholderContentView<Self>
}

extension Transition where Self == OffsetTransition {
    /* @MainActor @preconcurrency */ public static func offset(_ offset: CGSize) -> Self {
        //~~~
    }

    /* @MainActor @preconcurrency */ public static func offset(x: CGFloat = 0, y: CGFloat = 0) -> Self {
        //~~~
    }
}

extension Transition where Self == MoveTransition {
    /* @MainActor @preconcurrency */ public static func move(edge: Edge) -> Self {
        //~~~
    }
}

extension Transition where Self == OpacityTransition {
    /* @MainActor @preconcurrency */ public static var opacity: OpacityTransition {
        //~~~
    }
}

extension Transition where Self == SlideTransition {
    /* @MainActor @preconcurrency */ public static var slide: SlideTransition {
        //~~~
    }
}

extension Transition where Self == PushTransition {
    /* @MainActor @preconcurrency */ public static func push(from edge: Edge) -> Self {
        //~~~
    }
}

extension Transition {
    /* @MainActor @preconcurrency */ public func animation(_ animation: Animation?) -> some Transition {
        //~~~
    }
}

extension Transition {
    /* @MainActor @preconcurrency */ public func combined<T>(with other: T) -> some Transition where T : Transition {
        //~~~
    }
}

extension Transition {
    /* @MainActor @preconcurrency */ public static var properties: TransitionProperties {
        //~~~
    }

    /* @MainActor @preconcurrency */ public func apply<V>(content: V, phase: TransitionPhase) -> some View where V : View {
        //~~~
    }

}

extension Transition where Self == IdentityTransition {
    @MainActor @preconcurrency public static var identity: IdentityTransition {
        //~~~
    }
}

extension Transition where Self == BlurReplaceTransition {
    /* @MainActor @preconcurrency */ public static func blurReplace(_ config: BlurReplaceTransition.Configuration = .downUp) -> Self {
        //~~~
    }

    /* @MainActor @preconcurrency */ public static var blurReplace: BlurReplaceTransition {
        //~~~
    }
}

extension Transition where Self == ScaleTransition {
    /* @MainActor @preconcurrency */ public static var scale: ScaleTransition {
        //~~~
    }

    /* @MainActor @preconcurrency */ public static func scale(_ scale: Double, anchor: UnitPoint = .center) -> Self {
        //~~~
    }
}

@frozen public enum TransitionPhase : Hashable /*, BitwiseCopyable, Sendable */ {
    case willAppear
    case identity
    case didDisappear

    public var isIdentity: Bool {
        switch self {
        case .identity:
            return true
        default:
            return false
        }
    }
}

extension TransitionPhase {
    public var value: Double {
        switch self {
        case .identity:
            return 0
        case .willAppear:
            return -1
        case .didDisappear:
            return 1
        }
    }
}

public struct TransitionProperties : Sendable {
    public init(hasMotion: Bool = true) {
        self.hasMotion = hasMotion
    }

    public var hasMotion: Bool
}

@frozen public struct AnyTransition {
    private let transition: any Transition

    public init<T>(_ transition: T) where T : Transition {
        self.transition = transition
    }
}

extension AnyTransition {
    public static func modifier<E>(active: E, identity: E) -> AnyTransition where E : ViewModifier {
        //~~~
    }
}

extension AnyTransition {
    public static func offset(_ offset: CGSize) -> AnyTransition {
        //~~~
    }

    public static func offset(x: CGFloat = 0, y: CGFloat = 0) -> AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public static func move(edge: Edge) -> AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public static let opacity: AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public static func asymmetric(insertion: AnyTransition, removal: AnyTransition) -> AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public static var slide: AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public static func push(from edge: Edge) -> AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public func animation(_ animation: Animation?) -> AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public func combined(with other: AnyTransition) -> AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public static let identity: AnyTransition {
        //~~~
    }
}

extension AnyTransition {
    public static var scale: AnyTransition {
        //~~~
    }

    public static func scale(scale: CGFloat, anchor: UnitPoint = .center) -> AnyTransition {
        //~~~
    }
}

/// A composite `Transition` that uses a different transition for
/// insertion versus removal.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct AsymmetricTransition<Insertion, Removal> : Transition where Insertion : Transition, Removal : Transition {

    /// The `Transition` defining the insertion phase of `self`.
    @MainActor @preconcurrency public var insertion: Insertion

    /// The `Transition` defining the removal phase of `self`.
    @MainActor @preconcurrency public var removal: Removal

    /// Creates a composite `Transition` that uses a different transition for
    /// insertion versus removal.
    @MainActor @preconcurrency public init(insertion: Insertion, removal: Removal)

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: AsymmetricTransition<Insertion, Removal>.Content, phase: TransitionPhase) -> some View


    /// Returns the properties this transition type has.
    ///
    /// Defaults to `TransitionProperties()`.
    @MainActor @preconcurrency public static var properties: TransitionProperties { get }

    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = some View
}

/// A transition that animates the insertion or removal of a view by
/// combining blurring and scaling effects.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct BlurReplaceTransition : Transition {

    /// Configuration properties for a transition.
    public struct Configuration : Equatable {

        /// A configuration that requests a transition that scales the
        /// view down while removing it and up while inserting it.
        public static let downUp: BlurReplaceTransition.Configuration

        /// A configuration that requests a transition that scales the
        /// view up while both removing and inserting it.
        public static let upUp: BlurReplaceTransition.Configuration

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: BlurReplaceTransition.Configuration, b: BlurReplaceTransition.Configuration) -> Bool
    }

    /// The transition configuration.
    @MainActor @preconcurrency public var configuration: BlurReplaceTransition.Configuration

    /// Creates a new transition.
    ///
    /// - Parameter configuration: the transition configuration.
    @MainActor @preconcurrency public init(configuration: BlurReplaceTransition.Configuration)

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: BlurReplaceTransition.Content, phase: TransitionPhase) -> some View


    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = some View
}

/// A kind of transition that applies to the content within a single view,
/// rather than to the insertion or removal of a view.
///
/// Set the behavior of content transitions within a view with the
/// ``View/contentTransition(_:)`` modifier, passing in one of the defined
/// transitions, such as ``opacity`` or ``interpolate`` as the parameter.
///
/// > Tip: Content transitions only take effect within transactions that apply
/// an ``Animation`` to the views inside the ``View/contentTransition(_:)``
/// modifier.
///
/// Content transitions only take effect within the context of an
/// ``Animation`` block.
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct ContentTransition : Equatable, Sendable {

    /// The identity content transition, which indicates that content changes
    /// shouldn't animate.
    ///
    /// You can pass this value to a ``View/contentTransition(_:)``
    /// modifier to selectively disable animations that would otherwise
    /// be applied by a ``withAnimation(_:_:)`` block.
    public static let identity: ContentTransition

    /// A content transition that indicates content fades from transparent
    /// to opaque on insertion, and from opaque to transparent on removal.
    public static let opacity: ContentTransition

    /// A content transition that indicates the views attempt to interpolate
    /// their contents during transitions, where appropriate.
    ///
    /// Text views can interpolate transitions when the text views have
    /// identical strings. Matching glyph pairs can animate changes to their
    /// color, position, size, and any variable properties. Interpolation can
    /// apply within a ``Font/Design`` case, but not between cases, or between
    /// entirely different fonts. For example, you can interpolate a change
    /// between ``Font/Weight/thin`` and ``Font/Weight/black`` variations of a
    /// font, since these are both cases of ``Font/Weight``. However, you can't
    /// interpolate between the default design of a font and its Italic version,
    /// because these are different fonts. Any changes that can't show an
    /// interpolated animation use an opacity animation instead.
    ///
    /// Symbol images created with the ``Image/init(systemName:)`` initializer
    /// work the same way as text: changes within the same symbol attempt to
    /// interpolate the symbol's paths. When interpolation is unavailable, the
    /// system uses an opacity transition instead.
    public static let interpolate: ContentTransition

    /// Creates a content transition intended to be used with `Text`
    /// views displaying numeric text. In certain environments changes
    /// to the text will enable a nonstandard transition tailored to
    /// numeric characters that count up or down.
    ///
    /// - Parameters:
    ///   - countsDown: true if the numbers represented by the text
    ///     are counting downwards.
    ///
    /// - Returns: a new content transition.
    public static func numericText(countsDown: Bool = false) -> ContentTransition

    /// Creates a content transition intended to be used with `Text`
    /// views displaying numbers.
    ///
    /// The example below creates a text view displaying a particular
    /// value, assigning the same value to the associated transition:
    ///
    ///     Text("\(value)")
    ///         .contentTransition(.numericText(value: value))
    ///
    /// - Parameters:
    ///   - value: the value represented by the `Text` view being
    ///     animated. The difference between the old and new values
    ///     when the text changes will be used to determine the
    ///     animation direction.
    ///
    /// - Returns: a new content transition.
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public static func numericText(value: Double) -> ContentTransition

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ContentTransition, b: ContentTransition) -> Bool
}

/// A transition that returns the input view, unmodified, as the output
/// view.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct IdentityTransition : Transition {

    @MainActor @preconcurrency public init()

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: IdentityTransition.Content, phase: TransitionPhase) -> IdentityTransition.Content

    /// Returns the properties this transition type has.
    ///
    /// Defaults to `TransitionProperties()`.
    @MainActor @preconcurrency public static let properties: TransitionProperties

    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = IdentityTransition.Content
}

/// Returns a transition that moves the view away, towards the specified
/// edge of the view.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct MoveTransition : Transition {

    /// The edge to move the view towards.
    @MainActor @preconcurrency public var edge: Edge

    /// Creates a transition that moves the view away, towards the specified
    /// edge of the view.
    @MainActor @preconcurrency public init(edge: Edge)

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: MoveTransition.Content, phase: TransitionPhase) -> some View


    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = some View
}

/// Returns a transition that offset the view by the specified amount.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct OffsetTransition : Transition {

    /// The amount to offset the view by.
    @MainActor @preconcurrency public var offset: CGSize

    /// Creates a transition that offset the view by the specified amount.
    @MainActor @preconcurrency public init(_ offset: CGSize)

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: OffsetTransition.Content, phase: TransitionPhase) -> some View


    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = some View
}

/// A transition from transparent to opaque on insertion, and from opaque to
/// transparent on removal.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct OpacityTransition : Transition {

    @MainActor @preconcurrency public init()

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: OpacityTransition.Content, phase: TransitionPhase) -> some View


    /// Returns the properties this transition type has.
    ///
    /// Defaults to `TransitionProperties()`.
    @MainActor @preconcurrency public static let properties: TransitionProperties

    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = some View
}

/// A transition that when added to a view will animate the view's insertion by
/// moving it in from the specified edge while fading it in, and animate its
/// removal by moving it out towards the opposite edge and fading it out.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct PushTransition : Transition {

    /// The edge from which the view will be animated in.
    @MainActor @preconcurrency public var edge: Edge

    /// Creates a transition that animates a view by moving and fading it.
    @MainActor @preconcurrency public init(edge: Edge)

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: PushTransition.Content, phase: TransitionPhase) -> some View


    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = some View
}

/// Returns a transition that scales the view.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct ScaleTransition : Transition {

    /// The amount to scale the view by.
    @MainActor @preconcurrency public var scale: Double

    /// The anchor point to scale the view around.
    @MainActor @preconcurrency public var anchor: UnitPoint

    /// Creates a transition that scales the view by the specified amount.
    @MainActor @preconcurrency public init(_ scale: Double, anchor: UnitPoint = .center)

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: ScaleTransition.Content, phase: TransitionPhase) -> some View


    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = some View
}

/// A transition that inserts by moving in from the leading edge, and
/// removes by moving out towards the trailing edge.
///
/// - SeeAlso: `MoveTransition`
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@MainActor @preconcurrency public struct SlideTransition : Transition {

    @MainActor @preconcurrency public init()

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @MainActor @preconcurrency public func body(content: SlideTransition.Content, phase: TransitionPhase) -> some View


    /// The type of view representing the body.
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
    public typealias Body = some View
}

extension View {

    /// Modifies the view to use a given transition as its method of animating
    /// changes to the contents of its views.
    ///
    /// This modifier allows you to perform a transition that animates a change
    /// within a single view. The provided ``ContentTransition`` can present an
    /// opacity animation for content changes, an interpolated animation of
    /// the content's paths as they change, or perform no animation at all.
    ///
    /// > Tip: The `contentTransition(_:)` modifier only has an effect within
    /// the context of an ``Animation``.
    ///
    /// In the following example, a ``Button`` changes the color and font size
    /// of a ``Text`` view. Since both of these properties apply to the paths of
    /// the text, the ``ContentTransition/interpolate`` transition can animate a
    /// gradual change to these properties through the entire transition. By
    /// contrast, the ``ContentTransition/opacity`` transition would simply fade
    /// between the start and end states.
    ///
    ///     private static let font1 = Font.system(size: 20)
    ///     private static let font2 = Font.system(size: 45)
    ///
    ///     @State private var color = Color.red
    ///     @State private var currentFont = font1
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text("Content transition")
    ///                 .foregroundColor(color)
    ///                 .font(currentFont)
    ///                 .contentTransition(.interpolate)
    ///             Spacer()
    ///             Button("Change") {
    ///                 withAnimation(Animation.easeInOut(duration: 5.0)) {
    ///                     color = (color == .red) ? .green : .red
    ///                     currentFont = (currentFont == font1) ? font2 : font1
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// This example uses an ease-in–ease-out animation with a five-second
    /// duration to make it easier to see the effect of the interpolation. The
    /// figure below shows the `Text` at the beginning of the animation,
    /// halfway through, and at the end.
    ///
    /// | Time    | Display |
    /// | ------- | ------- |
    /// | Start   | ![The text Content transition in a small red font.](ContentTransition-1) |
    /// | Middle  | ![The text Content transition in a medium brown font.](ContentTransition-2) |
    /// | End     | ![The text Content transition in a large green font.](ContentTransition-3) |
    ///
    /// To control whether content transitions use GPU-accelerated rendering,
    /// set the value of the
    /// ``EnvironmentValues/contentTransitionAddsDrawingGroup`` environment
    /// variable.
    ///
    /// - parameter transition: The transition to apply when animating the
    ///   content change.
    nonisolated public func contentTransition(_ transition: ContentTransition) -> some View

}

extension View {

    /// Associates a transition with the view.
    ///
    /// When this view appears or disappears, the transition will be applied to
    /// it, allowing for animating it in and out.
    ///
    /// The following code will conditionally show MyView, and when it appears
    /// or disappears, will use a slide transition to show it.
    ///
    ///     if isActive {
    ///         MyView()
    ///             .transition(.slide)
    ///     }
    ///     Button("Toggle") {
    ///         withAnimation {
    ///             isActive.toggle()
    ///         }
    ///     }
    @inlinable nonisolated public func transition(_ t: AnyTransition) -> some View


    /// Associates a transition with the view.
    ///
    /// When this view appears or disappears, the transition will be applied to
    /// it, allowing for animating it in and out.
    ///
    /// The following code will conditionally show MyView, and when it appears
    /// or disappears, will use a custom RotatingFadeTransition transition to
    /// show it.
    ///
    ///     if isActive {
    ///         MyView()
    ///             .transition(RotatingFadeTransition())
    ///     }
    ///     Button("Toggle") {
    ///         withAnimation {
    ///             isActive.toggle()
    ///         }
    ///     }
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public func transition<T>(_ transition: T) -> some View where T : Transition

}
