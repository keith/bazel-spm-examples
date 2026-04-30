import RxSwift

public enum RxSwiftExample {
    public static func sumOfDoubles(_ values: [Int]) -> Int {
        var total = 0
        let bag = DisposeBag()
        Observable.from(values)
            .map { $0 * 2 }
            .subscribe(onNext: { total += $0 })
            .disposed(by: bag)
        return total
    }
}
