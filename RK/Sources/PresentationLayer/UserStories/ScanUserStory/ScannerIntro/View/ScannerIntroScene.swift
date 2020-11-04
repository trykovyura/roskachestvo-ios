//
// Created by Юрий Трыков on 30.05.2020.
//

import SwiftUI

struct ScannerIntroScene: ConnectedView {

    struct Props {
        let showingDetail: Binding<Bool>
        let action: () -> Void
        let barCodeAction: (String) -> Void
        let showProductDetails: Binding<Bool>
        let error: Binding<Bool>
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let showingDetail: Binding<Bool> = Binding<Bool>(
                get: { state.showingDetailScanner },
                set: { value in dispatch(Actions.ScannerAction.toggleScannerDetails(value))}
        )
        let showProductDetails: Binding<Bool> = Binding<Bool>(
                get: { state.productId != nil },
                set: { value in print(value) }
        )
        let action = { showingDetail.wrappedValue.toggle() }
        let barCodeAction = { barCode in
            dispatch(Actions.BarCodeAction.barCodeScannerDetails(barCode: barCode))
        }
        let error: Binding<Bool> = Binding<Bool>(
                get: { state.productId == nil },
                set: { value in print(value) }
        )
        return Props(showingDetail: showingDetail, action: action,
                barCodeAction: barCodeAction, showProductDetails: showProductDetails, error: error)
    }

    static func body(props: Props) -> some View {
        NavigationView {
            VStack(spacing: 16) {
                VStack(spacing: 16) {
                    NavigationLink(destination: ProductDetailsView(productId: nil),
                            isActive: props.showProductDetails) {
                        EmptyView()
                    }
                    R.image.scan.image
                    R.string.localizable.scannerIntroTitle.text
                            .bold()
                            .font(.system(size: 22))
                            .foregroundColor(R.color.gray.color)
                    R.string.localizable.scannerIntroDescription.text
                            .font(.system(size: 15))
                            .foregroundColor(R.color.gray.color)
                    Spacer()

                }.offset(y: 30)
                Button(action: props.action, label: {
                    R.string.localizable.scannerIntroScan.text
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 56)
                })
                        .background(R.color.viridianGreen.color)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 40)
                        .sheet(isPresented: props.showingDetail) { () -> ScannerViewScene in
                            ScannerViewScene { barCode in
                                props.barCodeAction(barCode)
                            }
                        }
            }.alert(isPresented: props.error) {
                Alert(title: Text("Important message"),
                        message: Text("Wear sunscreen"),
                        dismissButton: .default(Text("Got it!")))
            }
        }
    }
}
