//
// Created by Юрий Трыков on 08.08.2020.
//

import SwiftUI
import SkeletonUI

struct ProductDetailsView: ConnectedView {

    let productId: Int?

    struct ProductSection: Identifiable {
        let id: UUID = UUID()
        let items: [ProductCellViewModel]
    }
    struct ProductCellViewModel: Identifiable {
        let id: UUID = UUID()
        let name: String
        let value: String
    }
    struct Props {
        let product: ProductVO?
        let sections: [ProductSection]
        let appearTrigger: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let product = state.product?.id == self.productId ? state.product : nil
        let appearTrigger = {
            if let productId = productId {
                dispatch(Actions.ProductDetailsAction.start(productId: productId))
            }
        }
        var sections: [ProductSection] = []
        if let product = product {
            if let properties = product.properties {
                let items = properties.map { property -> ProductCellViewModel in
                    ProductCellViewModel(name: property.name ?? "", value: property.value ?? "")
                }
                sections.append(ProductSection(items: items))
            }
            if let indicators = product.indicators {
                let items = indicators.map { indicator -> ProductCellViewModel in
                    ProductCellViewModel(name: indicator.name ?? "", value: indicator.value ?? "")
                }
                sections.append(ProductSection(items: items))
            }
        }
        return Props(product: product, sections: sections, appearTrigger: appearTrigger)
    }

    static func body(props: Props) -> some View {
            List {
                Section {
                    VStack(alignment: .leading) {
                        HStack {
                            ImageView(image: nil, url: props.product?.image?.src?.imageURL(), loading: false)
                            Text(props.product?.name?.stringByDecodingHTMLEntities ?? "")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundColor(Color.black)
                        }
                        Text(R.string.localizable.productDetailsDescription())
                            .font(.system(size: 18, weight: .semibold))
                            .frame(alignment: .leading)
                            .foregroundColor(R.color.doveGray.color)
                        Text(props.product?.researchResults?
                                .stringByDecodingHTMLEntities.replacingOccurrences(of: "<br />", with: "") ?? "")
                            .font(.system(size: 14, weight: .regular))
                            .frame(alignment: .leading)
                            .foregroundColor(R.color.doveGray.color)
                    }
                }
                ForEach(props.sections) { gr in
                    Section {
                        ForEach(gr.items) { item in
                            ProductDetailsIndicatorCell(name: item.name, value: item.value)
                        }
                    }
                }
                Section {
                    VStack(alignment: .leading) {
                        Text("Плюсы")
                            .font(.system(size: 18, weight: .semibold))
                            .frame(alignment: .leading)
                            .foregroundColor(R.color.doveGray.color)
                        ForEach(props.product?.pros ?? ["Отсутствуют"], id: \.self) { item in
                            ProductDetailsPlusCell(name: item)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Минусы")
                            .font(.system(size: 18, weight: .semibold))
                            .frame(alignment: .leading)
                            .foregroundColor(R.color.doveGray.color)
                        ForEach(props.product?.cons ?? ["Отсутствуют"], id: \.self) { item in
                            ProductDetailsMinusCell(name: item)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .onAppear(perform: props.appearTrigger)
    }
}

struct ProductDetailsIndicatorCell: View {

    let name: String
    let value: String

    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 15) {
            Text(name)
                    .font(.system(size: 14.0, weight: .regular))
                    .foregroundColor(R.color.doveGray.color)
            Text(value.stringByDecodingHTMLEntities)
                    .font(.system(size: 16.0, weight: .medium))
                    .foregroundColor(R.color.doveGray.color)
                    .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct ProductDetailsPlusCell: View {

    let name: String

    var body: some View {
        HStack(spacing: 15) {
            R.image.plus.image
            Text(name)
                    .font(.system(size: 16.0, weight: .medium))
                    .foregroundColor(R.color.doveGray.color)
        }
    }
}

struct ProductDetailsMinusCell: View {

    let name: String

    var body: some View {
        HStack(spacing: 15) {
            R.image.minus.image
            Text(name)
                    .font(.system(size: 16.0, weight: .medium))
                    .foregroundColor(R.color.doveGray.color)
        }
    }
}
