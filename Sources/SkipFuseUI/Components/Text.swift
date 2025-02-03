// Copyright 2025 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
#if os(Android)
import SkipBridge
import SkipUI
#endif

// TODO: Actual implementation
public struct Text : View {
    private let text: String

    public init<S>(_ text: S) where S : StringProtocol {
        self.text = String(text)
    }

    public typealias Body = Never
}

#if os(Android)
extension Text : SkipUIBridging {
    public var Java_view: JavaObjectPointer? {
        return SkipUI.Text(verbatim: text).toJavaObject(options: [])
    }
}
#endif

//~~~
/*
struct MyView: View {
    var body: some View {
        Text("Hello")
    }
}

extension MyView: ComposeBridging {
 var Java_composable: JavaObjectPointer? {
     let box = SwiftValueTypeBox(self)
     let ptr = SwiftObjectPointer.pointer(to: box, retain: true)
     return try! Self.Java_class.create(ctor: Self.Java_constructor, options: [], args: [ptr.toJavaParameter(options: [])])
 }

 private static let Java_class = try! JClass(name: "<package>.MyView")
 private static let Java_constructor = Java_class.getMethodID(name: "<init>", sig: "(J)V")!
}

 @_cdecl("Java_MyView_Swift_1release")
 func MyView_Swift_release(_ Java_env: JNIEnvPointer, _ Java_target: JavaObjectPointer, _ Swift_peer: SwiftObjectPointer) {
     Swift_peer.release(as: SwiftValueTypeBox<MyView>.self)
 }

 @_cdecl("Java_MyView_Swift_1initState")
 func MyView_Swift_initState(_ Java_env: JNIEnvPointer, _ Java_target: JavaObjectPointer, _ Swift_peer: SwiftObjectPointer) {

 }

 @_cdecl("Java_MyView_Swift_1syncState")
 func MyView_Swift_syncState(_ Java_env: JNIEnvPointer, _ Java_target: JavaObjectPointer, _ Swift_peer: SwiftObjectPointer) {

 }

 @_cdecl("Java_MyView_Swift_1composableBody)
 func MyView_Swift_composableBody(_ Java_env: JNIEnvPointer, _ Java_target: JavaObjectPointer, _ Swift_peer: SwiftObjectPointer) -> JavaObjectPointer? {
     let peer_swift: SwiftValueTypeBox<MyView> = Swift_peer.pointee()!
     let body = peer_swift.value.body
     return (body as? ComposeBridging)?.Java_composable
 }

class MyView: skip.ui.View, skip.bridge.kt.SwiftPeerBridged, skip.lib.SwiftProjecting {
 var Swift_peer: skip.bridge.kt.SwiftObjectPointer = skip.bridge.kt.SwiftObjectNil

 constructor(Swift_peer: skip.bridge.kt.SwiftObjectPointer) {
     this.Swift_peer = Swift_peer
     Swift_initState(Swift_peer)
 }
 private external fun Swift_initState(Swift_peer: skip.bridge.kt.SwiftObjectPointer)
 private external fun Swift_syncState(Swift_peer: skip.bridge.kt.SwiftObjectPointer)

 fun finalize() {
     Swift_release(Swift_peer)
     Swift_peer = skip.bridge.kt.SwiftObjectNil
 }
 private external fun Swift_release(Swift_peer: skip.bridge.kt.SwiftObjectPointer)

 override fun Swift_peer(): skip.bridge.kt.SwiftObjectPointer = Swift_peer

   override fun body(): View {
     return ComposeBuilder { composectx: skip.ui.ComposeContext ->
         Swift_composableBody(Swift_view)?.Compose(composectx) ?: skip.ui.ComposeResult.ok
     }
   }
 private external fun Swift_composeBody(Swift_peer: skip.bridge.kt.SwiftObjectPointer)

 @Composable
 override fun ComposeContent(composectx: ComposeContext) {
    Swift_syncState(Swift_peer)
     super.ComposeContent(composectx)
 }
}
 */
