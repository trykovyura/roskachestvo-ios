//
// Created by Юрий Трыков on 11.07.2020.
//

import SwiftUI
import SkeletonUI

struct ProductFeedView: ConnectedView {

    let researchId: String

    struct Props {
        let research: ResearchVO?
        let title: String?
        let appearTrigger: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let research = state.research?.id == self.researchId ? state.research : nil
        let appearTrigger = {
            dispatch(Actions.ResearchFeedAction.start(researchId: self.researchId))
        }
        return Props(research: research, title: state.research?.anons, appearTrigger: appearTrigger)
    }

    static func body(props: Props) -> some View {
        VStack {
            Unwrap(props.title) { title in
                TextView(text: title)
            }
            SkeletonList(with: props.research?.products ?? [], quantity: 6) { (loading: Bool, product: ProductsVO?) in
                TextViewCell(name: product?.name ?? "", loading: loading)
                NavigationLink(destination: ProductDetailsView(productId: product?.id ?? 0)) {
                    EmptyView()
                }
            }.onAppear(perform: props.appearTrigger)
        }
    }
}
