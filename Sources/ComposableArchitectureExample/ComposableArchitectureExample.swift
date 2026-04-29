import ComposableArchitecture

@Reducer
public struct CounterFeature {
    @ObservableState
    public struct State: Equatable {
        public var count: Int

        public init(count: Int = 0) {
            self.count = count
        }
    }

    public enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .incrementButtonTapped:
                state.count += 1
                return .none
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            }
        }
    }
}
