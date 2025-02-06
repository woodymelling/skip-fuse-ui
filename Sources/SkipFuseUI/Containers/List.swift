// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//@MainActor @preconcurrency public struct List<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {
//
//    /// Creates a list with the given content that supports selecting multiple
//    /// rows.
//    ///
//    /// - Parameters:
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - content: The content of the list.
//    @available(watchOS, unavailable)
//    nonisolated public init(selection: Binding<Set<SelectionValue>>?, @ViewBuilder content: () -> Content)
//
//    /// Creates a list with the given content that supports selecting a single
//    /// row.
//    ///
//    /// - Parameters:
//    ///   - selection: A binding to a selected row.
//    ///   - content: The content of the list.
//    @available(watchOS 10.0, *)
//    nonisolated public init(selection: Binding<SelectionValue?>?, @ViewBuilder content: () -> Content)
//
//    /// The content of the list.
//    @MainActor @preconcurrency public var body: some View { get }
//
//    /// The type of view representing the body of this view.
//    ///
//    /// When you create a custom view, Swift infers this type from your
//    /// implementation of the required ``View/body-swift.property`` property.
//    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
//    public typealias Body = some View
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension List {
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data, optionally allowing users to select
//    /// multiple rows.
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, RowContent>(_ data: Data, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, RowContent>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a hierarchical list that computes its rows on demand from an
//    /// underlying collection of identifiable data, optionally allowing users to
//    /// select multiple rows.
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes an element
//    ///     capable of having children that's currently childless, such as an
//    ///     empty directory in a file system. On the other hand, if the property
//    ///     at the key path is `nil`, then the outline group treats `data` as a
//    ///     leaf in the tree, like a regular file in a file system.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(iOS 14.0, macOS 11.0, *)
//    @available(tvOS, unavailable)
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a list that identifies its rows based on a key path to the
//    /// identifier of the underlying data, optionally allowing users to select
//    /// multiple rows.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, RowContent>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//
//    /// Creates a hierarchical list that identifies its rows based on a key path
//    /// to the identifier of the underlying data, optionally allowing users to
//    /// select multiple rows.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(iOS 14.0, macOS 11.0, *)
//    @available(tvOS, unavailable)
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//
//    /// Creates a list that computes its views on demand over a constant range,
//    /// optionally allowing users to select multiple rows.
//    ///
//    /// This instance only reads the initial value of `data` and doesn't need to
//    /// identify views across updates. To compute views on demand over a dynamic
//    /// range, use ``List/init(_:id:selection:rowContent:)``.
//    ///
//    /// - Parameters:
//    ///   - data: A constant range of data to populate the list.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<RowContent>(_ data: Range<Int>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data, optionally allowing users to select a
//    /// single row.
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS 10.0, *)
//    nonisolated public init<Data, RowContent>(_ data: Data, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, RowContent>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a hierarchical list that computes its rows on demand from an
//    /// underlying collection of identifiable data, optionally allowing users to
//    /// select a single row.
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(iOS 14.0, macOS 11.0, *)
//    @available(tvOS, unavailable)
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a list that identifies its rows based on a key path to the
//    /// identifier of the underlying data, optionally allowing users to select a
//    /// single row.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS 10.0, *)
//    nonisolated public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, RowContent>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//
//    /// Creates a hierarchical list that identifies its rows based on a key path
//    /// to the identifier of the underlying data, optionally allowing users to
//    /// select a single row.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(iOS 14.0, macOS 11.0, *)
//    @available(tvOS, unavailable)
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//
//    /// Creates a list that computes its views on demand over a constant range,
//    /// optionally allowing users to select a single row.
//    ///
//    /// This instance only reads the initial value of `data` and doesn't need to
//    /// identify views across updates. To compute views on demand over a dynamic
//    /// range, use ``List/init(_:id:selection:rowContent:)``.
//    ///
//    /// - Parameters:
//    ///   - data: A constant range of data to populate the list.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<RowContent>(_ data: Range<Int>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, RowContent>, RowContent : View
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension List where SelectionValue == Never {
//
//    /// Creates a list with the given content.
//    ///
//    /// - Parameter content: The content of the list.
//    nonisolated public init(@ViewBuilder content: () -> Content)
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data.
//    ///
//    /// - Parameters:
//    ///   - data: A collection of identifiable data for computing the list.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, RowContent>(_ data: Data, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, RowContent>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a hierarchical list that computes its rows on demand from an
//    /// underlying collection of identifiable data.
//    ///
//    /// - Parameters:
//    ///   - data: A collection of identifiable data for computing the list.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(iOS 14.0, macOS 11.0, *)
//    @available(tvOS, unavailable)
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, RowContent>(_ data: Data, children: KeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a list that identifies its rows based on a key path to the
//    /// identifier of the underlying data.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, RowContent>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//
//    /// Creates a hierarchical list that identifies its rows based on a key path
//    /// to the identifier of the underlying data.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(iOS 14.0, macOS 11.0, *)
//    @available(tvOS, unavailable)
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, children: KeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == OutlineGroup<Data, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//
//    /// Creates a list that computes its views on demand over a constant range.
//    ///
//    /// This instance only reads the initial value of `data` and doesn't need to
//    /// identify views across updates. To compute views on demand over a dynamic
//    /// range, use ``List/init(_:id:rowContent:)``.
//    ///
//    /// - Parameters:
//    ///   - data: A constant range of data to populate the list.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<RowContent>(_ data: Range<Int>, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, RowContent>, RowContent : View
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension List {
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data, optionally allowing users to select
//    /// multiple rows.
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<LazyMapSequence<Data.Indices, (Data.Index, Data.Element.ID)>, Data.Element.ID, RowContent>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable, Data.Index : Hashable
//
//    /// Creates a list that identifies its rows based on a key path to the
//    /// identifier of the underlying data, optionally allowing users to select
//    /// multiple rows.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<LazyMapSequence<Data.Indices, (Data.Index, ID)>, ID, RowContent>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View, Data.Index : Hashable
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data, optionally allowing users to select a
//    /// single row.
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<LazyMapSequence<Data.Indices, (Data.Index, Data.Element.ID)>, Data.Element.ID, RowContent>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable, Data.Index : Hashable
//
//    /// Creates a list that identifies its rows based on a key path to the
//    /// identifier of the underlying data, optionally allowing users to select a
//    /// single row.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<LazyMapSequence<Data.Indices, (Data.Index, ID)>, ID, RowContent>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View, Data.Index : Hashable
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension List where SelectionValue == Never {
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data.
//    ///
//    /// - Parameters:
//    ///   - data: A collection of identifiable data for computing the list.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<LazyMapSequence<Data.Indices, (Data.Index, Data.Element.ID)>, Data.Element.ID, RowContent>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable, Data.Index : Hashable
//
//    /// Creates a list that identifies its rows based on a key path to the
//    /// identifier of the underlying data.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<LazyMapSequence<Data.Indices, (Data.Index, ID)>, ID, RowContent>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View, Data.Index : Hashable
//}
//
//@available(iOS 15.0, macOS 12.0, *)
//@available(tvOS, unavailable)
//@available(watchOS, unavailable)
//extension List {
//
//    /// Creates a hierarchical list that computes its rows on demand from a
//    /// binding to an underlying collection of identifiable data, optionally
//    /// allowing users to select multiple rows.
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes an element
//    ///     capable of having children that's currently childless, such as an
//    ///     empty directory in a file system. On the other hand, if the property
//    ///     at the key path is `nil`, then the outline group treats `data` as a
//    ///     leaf in the tree, like a regular file in a file system.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, children: WritableKeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a hierarchical list that identifies its rows based on a key path
//    /// to the identifier of the underlying data, optionally allowing users to
//    /// select multiple rows.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, children: WritableKeyPath<Data.Element, Data?>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//
//    /// Creates a hierarchical list that computes its rows on demand from a
//    /// binding to an underlying collection of identifiable data, optionally
//    /// allowing users to select a single row.
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, children: WritableKeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a hierarchical list that identifies its rows based on a key path
//    /// to the identifier of the underlying data, optionally allowing users to
//    /// select a single row.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, children: WritableKeyPath<Data.Element, Data?>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//}
//
//@available(iOS 15.0, macOS 12.0, *)
//@available(tvOS, unavailable)
//@available(watchOS, unavailable)
//extension List where SelectionValue == Never {
//
//    /// Creates a hierarchical list that computes its rows on demand from a
//    /// binding to an underlying collection of identifiable data.
//    ///
//    /// - Parameters:
//    ///   - data: A collection of identifiable data for computing the list.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, children: WritableKeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, Data.Element.ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
//
//    /// Creates a hierarchical list that identifies its rows based on a key path
//    /// to the identifier of the underlying data.
//    ///
//    /// - Parameters:
//    ///   - data: The data for populating the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - children: A key path to a property whose non-`nil` value gives the
//    ///     children of `data`. A non-`nil` but empty value denotes a node capable
//    ///     of having children that is currently childless, such as an empty
//    ///     directory in a file system. On the other hand, if the property at the
//    ///     key path is `nil`, then `data` is treated as a leaf node in the tree,
//    ///     like a regular file in a file system.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, children: WritableKeyPath<Data.Element, Data?>, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == OutlineGroup<Binding<Data>, ID, RowContent, RowContent, DisclosureGroup<RowContent, OutlineSubgroupChildren>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension List {
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable, allows to edit the collection, and
//    /// optionally allows users to select multiple rows.
//    ///
//    /// The following example creates a list to display a collection of favorite
//    /// foods allowing the user to delete or move elements from the
//    /// collection, and select multiple elements.
//    ///
//    ///     List(
//    ///         $foods,
//    ///         editActions: [.delete, .move],
//    ///         selection: $selectedFoods
//    ///     ) { $food in
//    ///        HStack {
//    ///            Text(food.name)
//    ///            Toggle("Favorite", isOn: $food.isFavorite)
//    ///        }
//    ///     }
//    ///
//    /// Use ``View/deleteDisabled(_:)`` and ``View/moveDisabled(_:)``
//    /// to disable respectively delete or move actions on a per-row basis.
//    ///
//    /// Explicit ``DynamicViewContent.onDelete(perform:)``,
//    /// ``DynamicViewContent.onMove(perform:)``, or
//    /// ``View.swipeActions(edge:allowsFullSwipe:content:)``
//    /// modifiers will override any synthesized action
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing and to be edited by
//    ///     the list.
//    ///   - editActions: The edit actions that are synthesized on `data`.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, editActions: EditActions<Data>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<IndexedIdentifierCollection<Data, Data.Element.ID>, Data.Element.ID, EditableCollectionContent<RowContent, Data>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable, Data.Index : Hashable
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable, allows to edit the collection, and
//    /// optionally allows users to select multiple rows.
//    ///
//    /// The following example creates a list to display a collection of favorite
//    /// foods allowing the user to delete or move elements from the
//    /// collection, and select multiple elements.
//    ///
//    ///     List(
//    ///         $foods,
//    ///         editActions: [.delete, .move],
//    ///         selection: $selectedFoods
//    ///     ) { $food in
//    ///        HStack {
//    ///            Text(food.name)
//    ///            Toggle("Favorite", isOn: $food.isFavorite)
//    ///        }
//    ///     }
//    ///
//    /// Use ``View/deleteDisabled(_:)`` and ``View/moveDisabled(_:)``
//    /// to disable respectively delete or move actions on a per-row basis.
//    ///
//    /// Explicit ``DynamicViewContent.onDelete(perform:)``,
//    /// ``DynamicViewContent.onMove(perform:)``, or
//    /// ``View.swipeActions(edge:allowsFullSwipe:content:)``
//    /// modifiers will override any synthesized action
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing and to be edited by
//    ///     the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - editActions: The edit actions that are synthesized on `data`.
//    ///   - selection: A binding to a set that identifies selected rows.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, editActions: EditActions<Data>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<IndexedIdentifierCollection<Data, ID>, ID, EditableCollectionContent<RowContent, Data>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View, Data.Index : Hashable
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension List {
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data, allows to edit the collection, and
//    /// optionally allowing users to select a single row.
//    ///
//    /// The following example creates a list to display a collection of favorite
//    /// foods allowing the user to delete or move elements from the
//    /// collection, and select a single elements.
//    ///
//    ///     List(
//    ///         $foods,
//    ///         editActions: [.delete, .move],
//    ///         selection: $selectedFood
//    ///     ) { $food in
//    ///        HStack {
//    ///            Text(food.name)
//    ///            Toggle("Favorite", isOn: $food.isFavorite)
//    ///        }
//    ///     }
//    ///
//    /// Use ``View/deleteDisabled(_:)`` and ``View/moveDisabled(_:)``
//    /// to disable respectively delete or move actions on a per-row basis.
//    ///
//    /// Explicit ``DynamicViewContent.onDelete(perform:)``,
//    /// ``DynamicViewContent.onMove(perform:)``, or
//    /// ``View.swipeActions(edge:allowsFullSwipe:content:)``
//    /// modifiers will override any synthesized action
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - editActions: The edit actions that are synthesized on `data`.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, editActions: EditActions<Data>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<IndexedIdentifierCollection<Data, Data.Element.ID>, Data.Element.ID, EditableCollectionContent<RowContent, Data>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable, Data.Index : Hashable
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data, allows to edit the collection, and
//    /// optionally allowing users to select a single row.
//    ///
//    /// The following example creates a list to display a collection of favorite
//    /// foods allowing the user to delete or move elements from the
//    /// collection, and select a single elements.
//    ///
//    ///     List(
//    ///         $foods,
//    ///         editActions: [.delete, .move],
//    ///         selection: $selectedFood
//    ///     ) { $food in
//    ///        HStack {
//    ///            Text(food.name)
//    ///            Toggle("Favorite", isOn: $food.isFavorite)
//    ///        }
//    ///     }
//    ///
//    /// Use ``View/deleteDisabled(_:)`` and ``View/moveDisabled(_:)``
//    /// to disable respectively delete or move actions on a per-row basis.
//    ///
//    /// Explicit ``DynamicViewContent.onDelete(perform:)``,
//    /// ``DynamicViewContent.onMove(perform:)``, or
//    /// ``View.swipeActions(edge:allowsFullSwipe:content:)``
//    /// modifiers will override any synthesized action
//    ///
//    /// - Parameters:
//    ///   - data: The identifiable data for computing the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - editActions: The edit actions that are synthesized on `data`.
//    ///   - selection: A binding to a selected value.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    @available(watchOS, unavailable)
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, editActions: EditActions<Data>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<IndexedIdentifierCollection<Data, ID>, ID, EditableCollectionContent<RowContent, Data>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View, Data.Index : Hashable
//}
//
//@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//extension List where SelectionValue == Never {
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data and allows to edit the collection.
//    ///
//    /// The following example creates a list to display a collection of favorite
//    /// foods allowing the user to delete or move elements from the
//    /// collection.
//    ///
//    ///     List($foods, editActions: [.delete, .move]) { $food in
//    ///        HStack {
//    ///            Text(food.name)
//    ///            Toggle("Favorite", isOn: $food.isFavorite)
//    ///        }
//    ///     }
//    ///
//    /// Use ``View/deleteDisabled(_:)`` and ``View/moveDisabled(_:)``
//    /// to disable respectively delete or move actions on a per-row basis.
//    ///
//    /// Explicit ``DynamicViewContent.onDelete(perform:)``,
//    /// ``DynamicViewContent.onMove(perform:)``, or
//    /// ``View.swipeActions(edge:allowsFullSwipe:content:)``
//    /// modifiers will override any synthesized action
//    ///
//    /// - Parameters:
//    ///   - data: A collection of identifiable data for computing the list.
//    ///   - editActions: The edit actions that are synthesized on `data`.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, RowContent>(_ data: Binding<Data>, editActions: EditActions<Data>, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<IndexedIdentifierCollection<Data, Data.Element.ID>, Data.Element.ID, EditableCollectionContent<RowContent, Data>>, Data : MutableCollection, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable, Data.Index : Hashable
//
//    /// Creates a list that computes its rows on demand from an underlying
//    /// collection of identifiable data and allows to edit the collection.
//    ///
//    /// The following example creates a list to display a collection of favorite
//    /// foods allowing the user to delete or move elements from the
//    /// collection.
//    ///
//    ///     List($foods, editActions: [.delete, .move]) { $food in
//    ///        HStack {
//    ///            Text(food.name)
//    ///            Toggle("Favorite", isOn: $food.isFavorite)
//    ///        }
//    ///     }
//    ///
//    /// Use ``View/deleteDisabled(_:)`` and ``View/moveDisabled(_:)``
//    /// to disable respectively delete or move actions on a per-row basis.
//    ///
//    /// Explicit ``DynamicViewContent.onDelete(perform:)``,
//    /// ``DynamicViewContent.onMove(perform:)``, or
//    /// ``View.swipeActions(edge:allowsFullSwipe:content:)``
//    /// modifiers will override any synthesized action
//    ///
//    /// - Parameters:
//    ///   - data: A collection of identifiable data for computing the list.
//    ///   - id: The key path to the data model's identifier.
//    ///   - editActions: The edit actions that are synthesized on `data`.
//    ///   - rowContent: A view builder that creates the view for a single row of
//    ///     the list.
//    nonisolated public init<Data, ID, RowContent>(_ data: Binding<Data>, id: KeyPath<Data.Element, ID>, editActions: EditActions<Data>, @ViewBuilder rowContent: @escaping (Binding<Data.Element>) -> RowContent) where Content == ForEach<IndexedIdentifierCollection<Data, ID>, ID, EditableCollectionContent<RowContent, Data>>, Data : MutableCollection, Data : RandomAccessCollection, ID : Hashable, RowContent : View, Data.Index : Hashable
//}
