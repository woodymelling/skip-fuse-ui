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
