//
// Created by Юрий Трыков on 11.07.2020.
//

import SwiftUI
import SkeletonUI

struct ProductFeedView: ConnectedView {

    let researchId: String

    struct Props {
        let research: ResearchVO?
        let appearTrigger: () -> Void
        let columns: [GridItem]
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let research = state.research?.id == self.researchId ? state.research : nil
        let appearTrigger = {
            dispatch(Actions.ResearchFeedAction.start(researchId: self.researchId))
        }
        let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
        return Props(research: research, appearTrigger: appearTrigger, columns: columns)
    }

    static func body(props: Props) -> some View {
        ScrollView {
            LazyVGrid(columns: props.columns, spacing: 20) {
                ForEach(props.research?.products ?? [], id: \.self) { product in
                    let destination = AnyView(ProductDetailsView(productId: product.id))
                    NavigationLink(destination: destination) {
                        FeedCellView(viewModel: FeedCellViewModel(vo: product, loading: false))
                                .navigationBarTitle(R.string.localizable.productsTitle())
                                .font(.largeTitle)
                                .cornerRadius(10)
                                .frame(height: 164)
                                .frame(maxWidth: .infinity)
                                .shadow(radius: 4)
                    }

                }
            }
            .padding(.horizontal)
        }
        .onAppear(perform: props.appearTrigger)
    }
}
