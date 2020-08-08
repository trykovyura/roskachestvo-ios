//
// Created by Юрий Трыков on 11.07.2020.
//

import SwiftUI
import SkeletonUI

struct ResearchDetailsView: ConnectedView {

    let researchId: String

    struct Props {
        let research: ResearchVO?
        let appearTrigger: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let research = state.research?.id == self.researchId ? state.research : nil
        let appearTrigger = {
            dispatch(Actions.ResearchDetailsAction.start(researchId: self.researchId))
        }
        return Props(research: research, appearTrigger: appearTrigger)
    }

    static func body(props: Props) -> some View {
        SkeletonList(with: props.research?.products ?? [], quantity: 6) { (loading: Bool, product: ProductsVO?) in
            TextView(name: product?.name ?? "", loading: loading)
        }.onAppear(perform: props.appearTrigger)
    }
}
