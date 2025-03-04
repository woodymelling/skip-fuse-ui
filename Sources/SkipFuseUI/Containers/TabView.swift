// Copyright 2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import SkipBridge
import SkipUI

@MainActor /* @preconcurrency */ public struct TabView<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {
    private let selection: Binding<SelectionValue>?
    private let content: Content

    /* nonisolated */ public init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content) {
        self.selection = selection
        self.content = content()
    }

//    nonisolated public init<C>(selection: Binding<SelectionValue>, @TabContentBuilder<SelectionValue> content: () -> C) where Content == TabContentBuilder<SelectionValue>.Content<C>, C : TabContent

    public typealias Body = Never
}

extension TabView : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        let selectionGet: (() -> Any)?
        let selectionSet: ((Any) -> Void)?
        if let selection {
            selectionGet = { SwiftHashable(selection.get()) }
            selectionSet = { selection.set(($0 as! SwiftHashable).value as! SelectionValue) }
        } else {
            selectionGet = nil
            selectionSet = nil
        }
        return SkipUI.TabView(selectionGet: selectionGet, selectionSet: selectionSet, bridgedContent: content.Java_viewOrEmpty)
    }
}

extension TabView where SelectionValue == Int {
    /* nonisolated */ public init(@ViewBuilder content: () -> Content) {
        self.init(selection: nil, content: content)
    }
}

//extension TabView {
//    nonisolated public init<C>(@TabContentBuilder<Never> content: () -> C) where SelectionValue == Never, Content == TabContentBuilder<Never>.Content<C>, C : TabContent
//}

extension View {
    nonisolated public func tabItem<V>(@ViewBuilder _ label: () -> V) -> some View where V : View {
        let label = label()
        return ModifierView(target: self) {
            return $0.Java_viewOrEmpty.tabItem(bridgedLabel: label.Java_viewOrEmpty)
        }
    }
}

@MainActor /* @preconcurrency */ public protocol TabViewStyle {
}

@MainActor /* @preconcurrency */ public struct SidebarAdaptableTabViewStyle : TabViewStyle {
    nonisolated public init() {
    }
}

extension TabViewStyle where Self == SidebarAdaptableTabViewStyle {
    @MainActor /* @preconcurrency */ public static var sidebarAdaptable: SidebarAdaptableTabViewStyle {
        return SidebarAdaptableTabViewStyle()
    }
}

@MainActor /* @preconcurrency */ public struct TabBarOnlyTabViewStyle : TabViewStyle {
    nonisolated public init() {
    }
}

extension TabViewStyle where Self == TabBarOnlyTabViewStyle {
    @MainActor /* @preconcurrency */ public static var tabBarOnly: TabBarOnlyTabViewStyle {
        return TabBarOnlyTabViewStyle()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension TabViewStyle where Self == DefaultTabViewStyle {

    /// The default tab view style.
    @MainActor @preconcurrency public static var automatic: DefaultTabViewStyle { get }
}

@available(macOS 15.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension TabViewStyle where Self == GroupedTabViewStyle {

    /// A tab view style that displays a tab bar that groups its
    /// tabs together.
    ///
    /// To apply this style to a tab view, or to a view that contains tab views, use
    /// the ``View/tabViewStyle(_:)`` modifier.
    @MainActor @preconcurrency public static var grouped: GroupedTabViewStyle { get }
}
