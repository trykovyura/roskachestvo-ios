//
// Created by Юрий Трыков on 08.08.2020.
//

import SwiftUI
import SkeletonUI

struct ProductDetailsView: ConnectedView {

    let productId: Int

    struct Props {
        let product: ProductVO?
        let appearTrigger: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let product = state.product?.id == self.productId ? state.product : nil
        let appearTrigger = {
            dispatch(Actions.ProductDetailsAction.start(productId: self.productId))
        }
        return Props(product: product, appearTrigger: appearTrigger)
    }

    static func body(props: Props) -> some View {
        SkeletonList(with: props.product?.indicators ?? [],
                quantity: 6) { (loading: Bool, indicator: ProductIndicatorVO?) in
            TextView(name: indicator?.name ?? indicator?.value ?? "", loading: loading)
        }.onAppear(perform: props.appearTrigger)
    }
}
