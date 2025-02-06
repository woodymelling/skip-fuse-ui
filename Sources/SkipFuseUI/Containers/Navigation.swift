// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import SkipUI

// TODO: Actual implementation
@MainActor @preconcurrency public struct NavigationStack<Data, Root> : View where Root : View {
    private let root: Root

    /* nonisolated */ public init(@ViewBuilder root: () -> Root) where Data == NavigationPath {
        self.root = root()
    }

//    nonisolated public init(path: Binding<NavigationPath>, @ViewBuilder root: () -> Root) where Data == NavigationPath {
//
//    }
//
//    nonisolated public init(path: Binding<Data>, @ViewBuilder root: () -> Root) where Data : MutableCollection, Data : RandomAccessCollection, Data : RangeReplaceableCollection, Data.Element : Hashable {
//
//    }

    public typealias Body = Never
}

extension NavigationStack : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return SkipUI.NavigationStack(bridgedRoot: (root as? SkipUIBridging)?.Java_view ?? SkipUI.EmptyView())
    }
}

@MainActor @preconcurrency public struct NavigationLink<Label, Destination> : View where Label : View, Destination : View {
    private let destination: Destination
    private let label: Label

    /* nonisolated */ public init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination()
        self.label = label()
    }

    /* nonisolated */ public init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.init(destination: { destination }, label: label)
    }

    public typealias Body = Never
}

extension NavigationLink : SkipUIBridging {
    public var Java_view: any SkipUI.View {
        return SkipUI.NavigationLink(bridgedDestination: (destination as? SkipUIBridging)?.Java_view ?? SkipUI.EmptyView(), bridgedLabel: (label as? SkipUIBridging)?.Java_view ?? SkipUI.EmptyView())
    }
}

//extension NavigationLink where Destination == Never {
//    nonisolated public init<P>(value: P?, @ViewBuilder label: () -> Label) where P : Hashable
//
//    nonisolated public init<P>(_ titleKey: LocalizedStringKey, value: P?) where Label == Text, P : Hashable
//
//    nonisolated public init<S, P>(_ title: S, value: P?) where Label == Text, S : StringProtocol, P : Hashable
//
//    nonisolated public init<P>(value: P?, @ViewBuilder label: () -> Label) where P : Decodable, P : Encodable, P : Hashable
//
//    nonisolated public init<P>(_ titleKey: LocalizedStringKey, value: P?) where Label == Text, P : Decodable, P : Encodable, P : Hashable
//
//    nonisolated public init<S, P>(_ title: S, value: P?) where Label == Text, S : StringProtocol, P : Decodable, P : Encodable, P : Hashable
//}

extension NavigationLink where Label == Text {
//    nonisolated public init(_ titleKey: LocalizedStringKey, @ViewBuilder destination: () -> Destination)

    /* nonisolated */ public init<S>(_ title: S, @ViewBuilder destination: () -> Destination) where S : StringProtocol {
        self.init(destination: destination, label: { Text(title) })
    }

//    nonisolated public init(_ titleKey: LocalizedStringKey, destination: Destination)

    /* nonisolated */ public init<S>(_ title: S, destination: Destination) where S : StringProtocol {
        self.init(title, destination: { destination })
    }
}

//extension NavigationLink {
//    @MainActor @preconcurrency public func isDetailLink(_ isDetailLink: Bool) -> some View
//
//}

public struct NavigationPath {
//    public var count: Int { get }
//    public var isEmpty: Bool { get }
//    public var codable: NavigationPath.CodableRepresentation? { get }
//    public init()
//    public init<S>(_ elements: S) where S : Sequence, S.Element : Hashable
//    public init<S>(_ elements: S) where S : Sequence, S.Element : Decodable, S.Element : Encodable, S.Element : Hashable
//    public init(_ codable: NavigationPath.CodableRepresentation)
//    public mutating func append<V>(_ value: V) where V : Hashable
//    public mutating func append<V>(_ value: V) where V : Decodable, V : Encodable, V : Hashable
//    public mutating func removeLast(_ k: Int = 1)
//
//    public struct CodableRepresentation : Codable {
//        public init(from decoder: any Decoder) throws
//        public func encode(to encoder: any Encoder) throws
//    }
}

//extension NavigationPath : Equatable {
//    public static func == (lhs: NavigationPath, rhs: NavigationPath) -> Bool
//}
//
//extension NavigationPath.CodableRepresentation : Equatable {
//    public static func == (lhs: NavigationPath.CodableRepresentation, rhs: NavigationPath.CodableRepresentation) -> Bool
//}
