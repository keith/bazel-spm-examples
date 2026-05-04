public protocol ProxyType: AnyObject {
    associatedtype ParentObject: AnyObject
    associatedtype Delegate
}

open class BaseProxy<P: AnyObject, D> {
    public typealias ParentObject = P
    public typealias Delegate = D

    public let parent: P

    // Mirrors RxCocoa.DelegateProxy.init(parentObject:delegateProxy:).
    public init<Proxy>(
        parentObject: P,
        delegateProxy: Proxy.Type
    ) where Proxy: BaseProxy<P, D>,
            Proxy: ProxyType,
            Proxy.ParentObject == P,
            Proxy.Delegate == D
    {
        self.parent = parentObject
        _ = delegateProxy
    }
}
