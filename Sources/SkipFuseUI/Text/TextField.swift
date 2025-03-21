//// Copyright 2025 Skip
//// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
//import Foundation
//import SkipUI
//
///* @MainActor @preconcurrency */ public struct TextField<Label> : View where Label : View {
//    private let text: Binding<String>
//    private let prompt: Text?
//    private let label: Label
//
//    public typealias Body = Never
//}
//
//extension TextField : SkipUIBridging {
//    public var Java_view: any SkipUI.View {
//        return SkipUI.TextField(getText: { text.wrappedValue }, setText: { text.wrappedValue = $0 }, bridgedPrompt: prompt?.Java_view, isSecure: false, bridgedLabel: label.Java_viewOrEmpty)
//    }
//}
//
//extension TextField where Label == Text {
//    /* nonisolated */ public init<F>(_ titleKey: LocalizedStringKey, value: Binding<F.FormatInput?>, format: F, prompt: Text? = nil) where F : ParseableFormatStyle, F.FormatOutput == String {
//        let getText: (F.FormatInput?) -> String = {
//            guard let input = $0 else {
//                return ""
//            }
//            return format.format(input)
//        }
//        let setText: (String) -> F.FormatInput? = {
//            guard !$0.isEmpty else {
//                return nil
//            }
//            return try? format.parseStrategy.parse($0)
//        }
//        self.text = Binding<String>(get: { getText(value.wrappedValue) }, set: { value.wrappedValue = setText($0) })
//        self.label = Text(titleKey)
//        self.prompt = prompt
//    }
//
//    @_disfavoredOverload /* nonisolated */ public init<S, F>(_ title: S, value: Binding<F.FormatInput?>, format: F, prompt: Text? = nil) where S : StringProtocol, F : ParseableFormatStyle, F.FormatOutput == String {
//
//    }
//
//    /// Creates a text field that applies a format style to a bound
//    /// value, with a label generated from a localized title string.
//    ///
//    /// Use this initializer to create a text field that binds to a bound
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the format style can parse the
//    /// text. If the format style can't parse the input, the bound value
//    /// remains unchanged.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    ///
//    /// The following example uses a
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle>
//    /// instance to convert to and from a string representation. As the user types, the bound
//    /// value updates, which in turn updates three ``Text`` views that use
//    /// different format styles. If the user enters text that doesn't represent
//    /// a valid `Double`, the bound value doesn't update.
//    ///
//    ///     @State private var myDouble: Double = 0.673
//    ///     var body: some View {
//    ///         VStack {
//    ///             TextField(
//    ///                 "Double",
//    ///                 value: $myDouble,
//    ///                 format: .number
//    ///             )
//    ///             Text(myDouble, format: .number)
//    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
//    ///             Text(myDouble, format: .number.notation(.scientific))
//    ///         }
//    ///     }
//    ///
//    /// ![A text field with the string 0.673. Below this, three text views
//    /// showing the number with different styles: 0.673, 0.67300, and 6.73E-1.](TextField-init-format-1)
//    ///
//    /// - Parameters:
//    ///   - titleKey: The title of the text field, describing its purpose.
//    ///   - value: The underlying value to edit.
//    ///   - format: A format style of type `F` to use when converting between
//    ///     the string the user edits and the underlying value of type
//    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
//    ///     field leaves `binding.value` unchanged. If the user stops editing
//    ///     the text in an invalid state, the text field updates the field's
//    ///     text to the last known valid value.
//    ///   - prompt: A `Text` which provides users with guidance on what to type
//    ///     into the text field.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init<F>(_ titleKey: LocalizedStringKey, value: Binding<F.FormatInput>, format: F, prompt: Text? = nil) where F : ParseableFormatStyle, F.FormatOutput == String
//
//    /// Creates a text field that applies a format style to a bound
//    /// value, with a label generated from a title string.
//    ///
//    /// Use this initializer to create a text field that binds to a bound
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the format style can parse the
//    /// text. If the format style can't parse the input, the bound value
//    /// remains unchanged.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// The following example uses a
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle>
//    /// instance to convert to and from a string representation. As the user types, the bound
//    /// value updates, which in turn updates three ``Text`` views that use
//    /// different format styles. If the user enters text that doesn't represent
//    /// a valid `Double`, the bound value doesn't update.
//    ///
//    ///     @State private var label = "Double"
//    ///     @State private var myDouble: Double = 0.673
//    ///     var body: some View {
//    ///         VStack {
//    ///             TextField(
//    ///                 label,
//    ///                 value: $myDouble,
//    ///                 format: .number
//    ///             )
//    ///             Text(myDouble, format: .number)
//    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
//    ///             Text(myDouble, format: .number.notation(.scientific))
//    ///         }
//    ///     }
//    ///
//    /// ![A text field with the string 0.673. Below this, three text views
//    /// showing the number with different styles: 0.673, 0.67300, and 6.73E-1.](TextField-init-format-1)
//    /// - Parameters:
//    ///   - title: The title of the text field, describing its purpose.
//    ///   - value: The underlying value to edit.
//    ///   - format: A format style of type `F` to use when converting between
//    ///     the string the user edits and the underlying value of type
//    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
//    ///     field leaves `binding.value` unchanged. If the user stops editing
//    ///     the text in an invalid state, the text field updates the field's
//    ///     text to the last known valid value.
//    ///   - prompt: A `Text` which provides users with guidance on what to type
//    ///     into the text field.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init<S, F>(_ title: S, value: Binding<F.FormatInput>, format: F, prompt: Text? = nil) where S : StringProtocol, F : ParseableFormatStyle, F.FormatOutput == String
//
//    private static func text<F>(from value: Binding<F.FormatInput?>, format: F) -> Binding<String> where F : ParseableFormatStyle, F.FormatOutput == String {
//
//    }
//
//    private static func text<F>(from value: Binding<F.FormatInput>, format: F) -> Binding<String> {
//
//    }
//}
//
//extension TextField {
//
//    /// Creates a text field that applies a format style to a bound optional
//    /// value, with a label generated from a view builder.
//    ///
//    /// Use this initializer to create a text field that binds to a bound optional
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the format style can parse the
//    /// text. If the format style can't parse the input, the text field
//    /// sets the bound value to `nil`.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// The following example uses an optional
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound currency value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle/Currency>
//    /// instance to convert to and from a representation as U.S. dollars. As
//    /// the user types, a `View.onChange(of:_:)` modifier logs the new value to
//    /// the console. If the user enters an invalid currency value, like letters
//    /// or emoji, the console output is `Optional(nil)`.
//    ///
//    ///     @State private var myMoney: Double? = 300.0
//    ///     var body: some View {
//    ///         TextField(
//    ///             value: $myMoney,
//    ///             format: .currency(code: "USD")
//    ///         ) {
//    ///             Text("Currency (USD)")
//    ///         }
//    ///         .onChange(of: myMoney) { newValue in
//    ///             print ("myMoney: \(newValue)")
//    ///         }
//    ///     }
//    ///
//    /// - Parameters:
//    ///   - value: The underlying value to edit.
//    ///   - format: A format style of type `F` to use when converting between
//    ///     the string the user edits and the underlying value of type
//    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
//    ///     field sets `binding.value` to `nil`.
//    ///   - prompt: A `Text` which provides users with guidance on what to type
//    ///     into the text field.
//    ///   - label: A view builder that produces a label for the text field,
//    ///     describing its purpose.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init<F>(value: Binding<F.FormatInput?>, format: F, prompt: Text? = nil, @ViewBuilder label: () -> Label) where F : ParseableFormatStyle, F.FormatOutput == String
//
//    /// Creates a text field that applies a format style to a bound
//    /// value, with a label generated from a view builder.
//    ///
//    /// Use this initializer to create a text field that binds to a bound
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/ParseableFormatStyle>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the format style can parse the
//    /// text. If the format style can't parse the input, the bound value
//    /// remains unchanged.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// The following example uses a
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/FloatingPointFormatStyle>
//    /// instance to convert to and from a string representation. As the user types, the bound
//    /// value updates, which in turn updates three ``Text`` views that use
//    /// different format styles. If the user enters text that doesn't represent
//    /// a valid `Double`, the bound value doesn't update.
//    ///
//    ///     @State private var myDouble: Double = 0.673
//    ///     var body: some View {
//    ///         VStack {
//    ///             TextField(
//    ///                 value: $myDouble,
//    ///                 format: .number
//    ///             ) {
//    ///                 Text("Double")
//    ///             }
//    ///             Text(myDouble, format: .number)
//    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
//    ///             Text(myDouble, format: .number.notation(.scientific))
//    ///         }
//    ///     }
//    ///
//    /// ![A text field with the string 0.673. Below this, three text views
//    /// showing the number with different styles: 0.673, 0.67300, and 6.73E-1.](TextField-init-format-1)
//    ///
//    /// - Parameters:
//    ///   - value: The underlying value to edit.
//    ///   - format: A format style of type `F` to use when converting between
//    ///     the string the user edits and the underlying value of type
//    ///     `F.FormatInput`. If `format` can't perform the conversion, the text
//    ///     field leaves the value unchanged. If the user stops editing
//    ///     the text in an invalid state, the text field updates the field's
//    ///     text to the last known valid value.
//    ///   - prompt: A `Text` which provides users with guidance on what to type
//    ///     into the text field.
//    ///   - label: A view builder that produces a label for the text field,
//    ///     describing its purpose.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init<F>(value: Binding<F.FormatInput>, format: F, prompt: Text? = nil, @ViewBuilder label: () -> Label) where F : ParseableFormatStyle, F.FormatOutput == String
//}
//
//extension TextField where Label == Text {
//
//    /// Creates a text field that applies a formatter to a bound
//    /// value, with a label generated from a localized title string.
//    ///
//    /// Use this initializer to create a text field that binds to a bound
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/Formatter>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the formatter can parse the
//    /// text. If the format style can't parse the input, the bound value
//    /// remains unchanged.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// The following example uses a
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter>
//    /// instance to convert to and from a string representation. The formatter
//    /// uses the
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter/Style/decimal>
//    /// style, to allow entering a fractional part. As the user types, the bound
//    /// value updates, which in turn updates three ``Text`` views that use
//    /// different format styles. If the user enters text that doesn't represent
//    /// a valid `Double`, the bound value doesn't update.
//    ///
//    ///     @State private var myDouble: Double = 0.673
//    ///     @State private var numberFormatter: NumberFormatter = {
//    ///         var nf = NumberFormatter()
//    ///         nf.numberStyle = .decimal
//    ///         return nf
//    ///     }()
//    ///
//    ///     var body: some View {
//    ///         VStack {
//    ///             TextField(
//    ///                 "Double",
//    ///                 value: $myDouble,
//    ///                 formatter: numberFormatter
//    ///             )
//    ///             Text(myDouble, format: .number)
//    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
//    ///             Text(myDouble, format: .number.notation(.scientific))
//    ///         }
//    ///     }
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - value: The underlying value to edit.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     If `formatter` can't perform the conversion, the text field doesn't
//    ///     modify `binding.value`.
//    ///   - prompt: A `Text` which provides users with guidance on what to enter
//    ///     into the text field.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, formatter: Formatter, prompt: Text?)
//
//    /// Creates a text field that applies a formatter to a bound
//    /// value, with a label generated from a title string.
//    ///
//    /// Use this initializer to create a text field that binds to a bound
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/Formatter>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the formatter can parse the
//    /// text. If the format style can't parse the input, the bound value
//    /// remains unchanged.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    ///
//    /// The following example uses a
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter>
//    /// instance to convert to and from a string representation. The formatter
//    /// uses the
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter/Style/decimal>
//    /// style, to allow entering a fractional part. As the user types, the bound
//    /// value updates, which in turn updates three ``Text`` views that use
//    /// different format styles. If the user enters text that doesn't represent
//    /// a valid `Double`, the bound value doesn't update.
//    ///
//    ///     @State private var label = "Double"
//    ///     @State private var myDouble: Double = 0.673
//    ///     @State private var numberFormatter: NumberFormatter = {
//    ///         var nf = NumberFormatter()
//    ///         nf.numberStyle = .decimal
//    ///         return nf
//    ///     }()
//    ///
//    ///     var body: some View {
//    ///         VStack {
//    ///             TextField(
//    ///                 label,
//    ///                 value: $myDouble,
//    ///                 formatter: numberFormatter
//    ///             )
//    ///             Text(myDouble, format: .number)
//    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
//    ///             Text(myDouble, format: .number.notation(.scientific))
//    ///         }
//    ///     }
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text field, describing its purpose.
//    ///   - value: The underlying value to edit.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     If `formatter` can't perform the conversion, the text field doesn't
//    ///     modify `binding.value`.
//    ///   - prompt: A `Text` which provides users with guidance on what to enter
//    ///     into the text field.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init<S, V>(_ title: S, value: Binding<V>, formatter: Formatter, prompt: Text?) where S : StringProtocol
//}
//
//extension TextField {
//
//    /// Creates a text field that applies a formatter to a bound optional
//    /// value, with a label generated from a view builder.
//    ///
//    /// Use this initializer to create a text field that binds to a bound optional
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/Formatter>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the formatter can parse the
//    /// text. If the format style can't parse the input, the bound value
//    /// remains unchanged.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// The following example uses a
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter>
//    /// instance to convert to and from a string representation. The formatter
//    /// uses the
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter/Style/decimal>
//    /// style, to allow entering a fractional part. As the user types, the bound
//    /// value updates, which in turn updates three ``Text`` views that use
//    /// different format styles. If the user enters text that doesn't represent
//    /// a valid `Double`, the bound value doesn't update.
//    ///
//    ///     @State private var myDouble: Double = 0.673
//    ///     @State private var numberFormatter: NumberFormatter = {
//    ///         var nf = NumberFormatter()
//    ///         nf.numberStyle = .decimal
//    ///         return nf
//    ///     }()
//    ///
//    ///     var body: some View {
//    ///         VStack {
//    ///             TextField(
//    ///                 value: $myDouble,
//    ///                 formatter: numberFormatter
//    ///             ) {
//    ///                 Text("Double")
//    ///             }
//    ///             Text(myDouble, format: .number)
//    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
//    ///             Text(myDouble, format: .number.notation(.scientific))
//    ///         }
//    ///     }
//    ///
//    /// - Parameters:
//    ///   - value: The underlying value to edit.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     If `formatter` can't perform the conversion, the text field doesn't
//    ///     modify `binding.value`.
//    ///   - prompt: A `Text` which provides users with guidance on what to enter
//    ///     into the text field.
//    ///   - label: A view that describes the purpose of the text field.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init<V>(value: Binding<V>, formatter: Formatter, prompt: Text? = nil, @ViewBuilder label: () -> Label)
//}
//
//extension TextField where Label == Text {
//
//    /// Create an instance which binds over an arbitrary type, `V`.
//    ///
//    /// Use this initializer to create a text field that binds to a bound optional
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/Formatter>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the formatter can parse the
//    /// text. If the format style can't parse the input, the bound value
//    /// remains unchanged.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// The following example uses a
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter>
//    /// instance to convert to and from a string representation. The formatter
//    /// uses the
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter/Style/decimal>
//    /// style, to allow entering a fractional part. As the user types, the bound
//    /// value updates, which in turn updates three ``Text`` views that use
//    /// different format styles. If the user enters text that doesn't represent
//    /// a valid `Double`, the bound value doesn't update.
//    ///
//    ///     @State private var myDouble: Double = 0.673
//    ///     @State private var numberFormatter: NumberFormatter = {
//    ///         var nf = NumberFormatter()
//    ///         nf.numberStyle = .decimal
//    ///         return nf
//    ///     }()
//    ///
//    ///     var body: some View {
//    ///         VStack {
//    ///             TextField(
//    ///                 value: $myDouble,
//    ///                 formatter: numberFormatter
//    ///             ) {
//    ///                 Text("Double")
//    ///             }
//    ///             Text(myDouble, format: .number)
//    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
//    ///             Text(myDouble, format: .number.notation(.scientific))
//    ///         }
//    ///     }
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - value: The underlying value to edit.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     If `formatter` can't perform the conversion, the text field doesn't
//    ///     modify `binding.value`.
//    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//    nonisolated public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, formatter: Formatter)
//
//    /// Create an instance which binds over an arbitrary type, `V`.
//    ///
//    /// Use this initializer to create a text field that binds to a bound optional
//    /// value, using a
//    /// <doc://com.apple.documentation/documentation/Foundation/Formatter>
//    /// to convert to and from this type. Changes to the bound value update
//    /// the string displayed by the text field. Editing the text field
//    /// updates the bound value, as long as the formatter can parse the
//    /// text. If the format style can't parse the input, the bound value
//    /// remains unchanged.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// The following example uses a
//    /// <doc://com.apple.documentation/documentation/Swift/Double>
//    /// as the bound value, and a
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter>
//    /// instance to convert to and from a string representation. The formatter
//    /// uses the
//    /// <doc://com.apple.documentation/documentation/Foundation/NumberFormatter/Style/decimal>
//    /// style, to allow entering a fractional part. As the user types, the bound
//    /// value updates, which in turn updates three ``Text`` views that use
//    /// different format styles. If the user enters text that doesn't represent
//    /// a valid `Double`, the bound value doesn't update.
//    ///
//    ///     @State private var myDouble: Double = 0.673
//    ///     @State private var numberFormatter: NumberFormatter = {
//    ///         var nf = NumberFormatter()
//    ///         nf.numberStyle = .decimal
//    ///         return nf
//    ///     }()
//    ///
//    ///     var body: some View {
//    ///         VStack {
//    ///             TextField(
//    ///                 value: $myDouble,
//    ///                 formatter: numberFormatter
//    ///             ) {
//    ///                 Text("Double")
//    ///             }
//    ///             Text(myDouble, format: .number)
//    ///             Text(myDouble, format: .number.precision(.significantDigits(5)))
//    ///             Text(myDouble, format: .number.notation(.scientific))
//    ///         }
//    ///     }
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - value: The underlying value to edit.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     If `formatter` can't perform the conversion, the text field doesn't
//    ///     modify `binding.value`.
//    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//    nonisolated public init<S, V>(_ title: S, value: Binding<V>, formatter: Formatter) where S : StringProtocol
//}
//
//extension TextField where Label == Text {
//
//    /// Create an instance which binds over an arbitrary type, `V`.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - value: The underlying value to be edited.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     In the event that `formatter` is unable to perform the conversion,
//    ///     `binding.value` isn't modified.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    ///   - onCommit: An action to perform when the user performs an action
//    ///     (for example, when the user presses the Return key) while the text
//    ///     field has focus.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void, onCommit: @escaping () -> Void)
//
//    /// Create an instance which binds over an arbitrary type, `V`.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - value: The underlying value to be edited.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     In the event that `formatter` is unable to perform the conversion,
//    ///     `binding.value` isn't modified.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void)
//
//    /// Create an instance which binds over an arbitrary type, `V`.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - value: The underlying value to be edited.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     In the event that `formatter` is unable to perform the conversion,
//    ///     `binding.value` isn't modified.
//    ///   - onCommit: An action to perform when the user performs an action
//    ///     (for example, when the user presses the Return key) while the text
//    ///     field has focus.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, formatter: Formatter, onCommit: @escaping () -> Void)
//
//    /// Create an instance which binds over an arbitrary type, `V`.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text field, describing its purpose.
//    ///   - value: The underlying value to be edited.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     In the event that `formatter` is unable to perform the conversion,
//    ///     `binding.value` isn't modified.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    ///   - onCommit: An action to perform when the user performs an action
//    ///     (for example, when the user presses the Return key) while the text
//    ///     field has focus.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<S, V>(_ title: S, value: Binding<V>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void, onCommit: @escaping () -> Void) where S : StringProtocol
//
//    /// Create an instance which binds over an arbitrary type, `V`.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text field, describing its purpose.
//    ///   - value: The underlying value to be edited.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     In the event that `formatter` is unable to perform the conversion,
//    ///     `binding.value` isn't modified.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<S, V>(_ title: S, value: Binding<V>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void) where S : StringProtocol
//
//    /// Create an instance which binds over an arbitrary type, `V`.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text field, describing its purpose.
//    ///   - value: The underlying value to be edited.
//    ///   - formatter: A formatter to use when converting between the
//    ///     string the user edits and the underlying value of type `V`.
//    ///     In the event that `formatter` is unable to perform the conversion,
//    ///     `binding.value` isn't modified.
//    ///   - onCommit: An action to perform when the user performs an action
//    ///     (for example, when the user presses the Return key) while the text
//    ///     field has focus.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:value:formatter:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<S, V>(_ title: S, value: Binding<V>, formatter: Formatter, onCommit: @escaping () -> Void) where S : StringProtocol
//}
//
//extension TextField where Label == Text {
//
//    /// Creates a text field with a preferred axis and a text label generated
//    /// from a localized title string.
//    ///
//    /// Specify a preferred axis in which the text field should scroll
//    /// its content when it does not fit in the available space. Depending
//    /// on the style of the field, this axis may not be respected.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - axis: The axis in which to scroll text when it doesn't fit
//    ///     in the available space.
//    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//    nonisolated public init(_ titleKey: LocalizedStringKey, text: Binding<String>, axis: Axis)
//
//    /// Creates a text field with a preferred axis and a text label generated
//    /// from a localized title string.
//    ///
//    /// Specify a preferred axis in which the text field should scroll
//    /// its content when it does not fit in the available space. Depending
//    /// on the style of the field, this axis may not be respected.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - prompt: A `Text` representing the prompt of the text field
//    ///     which provides users with guidance on what to type into the text
//    ///     field.
//    ///   - axis: The axis in which to scroll text when it doesn't fit
//    ///     in the available space.
//    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//    nonisolated public init(_ titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?, axis: Axis)
//
//    /// Creates a text field with a preferred axis and a text label generated
//    /// from a title string.
//    ///
//    /// Specify a preferred axis in which the text field should scroll
//    /// its content when it does not fit in the available space. Depending
//    /// on the style of the field, this axis may not be respected.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - axis: The axis in which to scroll text when it doesn't fit
//    ///     in the available space.
//    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//    nonisolated public init<S>(_ title: S, text: Binding<String>, axis: Axis) where S : StringProtocol
//
//    /// Creates a text field with a text label generated from a title string.
//    ///
//    /// Specify a preferred axis in which the text field should scroll
//    /// its content when it does not fit in the available space. Depending
//    /// on the style of the field, this axis may not be respected.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - prompt: A `Text` representing the prompt of the text field
//    ///     which provides users with guidance on what to type into the text
//    ///     field.
//    ///   - axis: The axis in which to scroll text when it doesn't fit
//    ///     in the available space.
//    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//    nonisolated public init<S>(_ title: S, text: Binding<String>, prompt: Text?, axis: Axis) where S : StringProtocol
//}
//
//extension TextField {
//
//    /// Creates a text field with a preferred axis and a prompt generated from
//    /// a `Text`.
//    ///
//    /// Specify a preferred axis in which the text field should scroll
//    /// its content when it does not fit in the available space. Depending
//    /// on the style of the field, this axis may not be respected.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - text: The text to display and edit.
//    ///   - prompt: A `Text` representing the prompt of the text field
//    ///     which provides users with guidance on what to type into the text
//    ///     field.
//    ///   - axis: The axis in which to scroll text when it doesn't fit
//    ///     in the available space.
//    ///   - label: A view that describes the purpose of the text field.
//    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//    nonisolated public init(text: Binding<String>, prompt: Text? = nil, axis: Axis, @ViewBuilder label: () -> Label)
//}
//
//extension TextField where Label == Text {
//
//    /// Creates a text field with a text label generated from a localized title
//    /// string.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - prompt: A `Text` representing the prompt of the text field
//    ///     which provides users with guidance on what to type into the text
//    ///     field.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init(_ titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?)
//
//    /// Creates a text field with a text label generated from a title string.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - prompt: A `Text` representing the prompt of the text field
//    ///     which provides users with guidance on what to type into the text
//    ///     field.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init<S>(_ title: S, text: Binding<String>, prompt: Text?) where S : StringProtocol
//}
//
//extension TextField {
//
//    /// Creates a text field with a prompt generated from a `Text`.
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - text: The text to display and edit.
//    ///   - prompt: A `Text` representing the prompt of the text field
//    ///     which provides users with guidance on what to type into the text
//    ///     field.
//    ///   - label: A view that describes the purpose of the text field.
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    nonisolated public init(text: Binding<String>, prompt: Text? = nil, @ViewBuilder label: () -> Label)
//}
//
//@available(iOS 18.0, macOS 15.0, visionOS 2.0, *)
//@available(tvOS, unavailable)
//@available(watchOS, unavailable)
//extension TextField where Label == Text {
//
//    /// Creates a text field with a binding to the current selection and a text
//    /// label generated from a localized title string.
//    ///
//    /// The following example shows a text field with a binding the the current selection:
//    ///
//    ///     @State private var message: String = ""
//    ///     @State private var selection: TextSelection? = nil
//    ///
//    ///     var body: some View {
//    ///         TextField(
//    ///             "Message",
//    ///             text: $message,
//    ///             selection: $selection
//    ///         )
//    ///     }
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - selection: A ``Binding`` to the variable containing the selection.
//    ///   - prompt: A `Text` representing the prompt of the text field
//    ///     which provides users with guidance on what to type into the text
//    ///     field. Defaults to `nil`.
//    ///   - axis: The axis in which to scroll text when it doesn't fit
//    ///     in the available space. Defaults to `nil`.
//    nonisolated public init(_ titleKey: LocalizedStringKey, text: Binding<String>, selection: Binding<TextSelection?>, prompt: Text? = nil, axis: Axis? = nil)
//
//    /// Creates a text field with a binding to the current selection and a text
//    /// label generated from a title string.
//    ///
//    /// The following example shows a text field with a binding the the current selection:
//    ///
//    ///     @State private var message: String = ""
//    ///     @State private var selection: TextSelection? = nil
//    ///
//    ///     var body: some View {
//    ///         TextField(
//    ///             "Message",
//    ///             text: $message,
//    ///             selection: $selection
//    ///         )
//    ///     }
//    ///
//    /// Use the ``View/onSubmit(of:_:)`` modifier to invoke an action
//    /// whenever the user submits this text field.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - selection: A ``Binding`` to the variable containing the selection.
//    ///   - text: The text to display and edit.
//    ///   - prompt: A `Text` representing the prompt of the text field
//    ///     which provides users with guidance on what to type into the text
//    ///     field. Defaults to `nil`.
//    ///   - axis: The axis in which to scroll text when it doesn't fit
//    ///     in the available space. Defaults to `nil`
//    nonisolated public init<S>(_ title: S, text: Binding<String>, selection: Binding<TextSelection?>, prompt: Text? = nil, axis: Axis? = nil) where S : StringProtocol
//}
//
//extension TextField where Label == Text {
//
//    /// Creates a text field with a text label generated from a localized title
//    /// string.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - text: The text to display and edit.
//    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//    nonisolated public init(_ titleKey: LocalizedStringKey, text: Binding<String>)
//
//    /// Creates a text field with a text label generated from a title string.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - text: The text to display and edit.
//    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//    nonisolated public init<S>(_ title: S, text: Binding<String>) where S : StringProtocol
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension TextField where Label == Text {
//
//    /// Creates a text field with a text label generated from a localized title
//    /// string.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    ///   - onCommit: An action to perform when the user performs an action
//    ///     (for example, when the user presses the Return key) while the text
//    ///     field has focus.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void, onCommit: @escaping () -> Void)
//
//    /// Creates a text field with a text label generated from a localized title
//    /// string.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void)
//
//    /// Creates a text field with a text label generated from a localized title
//    /// string.
//    ///
//    /// - Parameters:
//    ///   - titleKey: The key for the localized title of the text field,
//    ///     describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - onCommit: An action to perform when the user performs an action
//    ///     (for example, when the user presses the Return key) while the text
//    ///     field has focus.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onCommit: @escaping () -> Void)
//
//    /// Creates a text field with a text label generated from a title string.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    ///   - onCommit: An action to perform when the user performs an action
//    ///     (for example, when the user presses the Return key) while the text
//    ///     field has focus.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<S>(_ title: S, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void, onCommit: @escaping () -> Void) where S : StringProtocol
//
//    /// Creates a text field with a text label generated from a title string.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<S>(_ title: S, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void) where S : StringProtocol
//
//    /// Creates a text field with a text label generated from a title string.
//    ///
//    /// - Parameters:
//    ///   - title: The title of the text view, describing its purpose.
//    ///   - text: The text to display and edit.
//    ///   - onEditingChanged: The action to perform when the user
//    ///     begins editing `text` and after the user finishes editing `text`.
//    ///     The closure receives a Boolean value that indicates the editing
//    ///     status: `true` when the user begins editing, `false` when they
//    ///     finish.
//    ///   - onCommit: An action to perform when the user performs an action
//    ///     (for example, when the user presses the Return key) while the text
//    ///     field has focus.
//    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Renamed TextField.init(_:text:onEditingChanged:). Use View.onSubmit(of:_:) for functionality previously provided by the onCommit parameter. Use FocusState<T> and View.focused(_:equals:) for functionality previously provided by the onEditingChanged parameter.")
//    nonisolated public init<S>(_ title: S, text: Binding<String>, onCommit: @escaping () -> Void) where S : StringProtocol
//}
//
///// A specification for the appearance and interaction of a text field.
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//public protocol TextFieldStyle {
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension TextFieldStyle where Self == DefaultTextFieldStyle {
//
//    /// The default text field style, based on the text field's context.
//    ///
//    /// The default style represents the recommended style based on the
//    /// current platform and the text field's context within the view hierarchy.
//    public static var automatic: DefaultTextFieldStyle { get }
//}
//
//@available(iOS 13.0, macOS 10.15, *)
//@available(tvOS, unavailable)
//@available(watchOS, unavailable)
//extension TextFieldStyle where Self == RoundedBorderTextFieldStyle {
//
//    /// A text field style with a system-defined rounded border.
//    public static var roundedBorder: RoundedBorderTextFieldStyle { get }
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension TextFieldStyle where Self == PlainTextFieldStyle {
//
//    /// A text field style with no decoration.
//    public static var plain: PlainTextFieldStyle { get }
//}
//
