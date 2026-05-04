import Foundation
import Library

final class MyProxy: BaseProxy<NSObject, AnyObject>, ProxyType {
    typealias ParentObject = NSObject
    typealias Delegate = AnyObject

    init(parent: NSObject) {
        super.init(parentObject: parent, delegateProxy: MyProxy.self)
    }
}

_ = MyProxy(parent: NSObject())
print("ok")
