//
// Created by Юрий Трыков on 08.08.2020.
//

import SwiftUI
import SkeletonUI
import UIKit

struct ProductDetailsView: ConnectedView {

    let productId: Int

    struct Props {
        let product: ProductVO?
        let title: String?
        let appearTrigger: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let product = state.product?.id == self.productId ? state.product : nil
        let appearTrigger = {
            dispatch(Actions.ProductDetailsAction.start(productId: self.productId))
        }
        return Props(product: product, title: state.product?.name, appearTrigger: appearTrigger)
    }

    static func body(props: Props) -> some View {
        VStack {
            Unwrap(props.title) { title in
                AttributedText(title)
            }
            SkeletonList(with: props.product?.indicators ?? [],
                    quantity: 6) { (loading: Bool, indicator: ProductIndicatorVO?) in
                TextViewCell(name: indicator?.name ?? indicator?.value ?? "", loading: loading)
            }.onAppear(perform: props.appearTrigger)
        }
    }
}
