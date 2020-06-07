//
// Created by Юрий Трыков on 30.05.2020.
//

import SwiftUI

struct ScannerIntroScene: ConnectedView {

    struct Props {
        let showingDetail: Binding<Bool>
        let action: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let showingDetail: Binding<Bool> = Binding<Bool>(
                get: { state.showingDetailScanner },
                set: { value in dispatch(Actions.ScannerAction.toggleScannerDetails(value))}
        )
        let action = { showingDetail.wrappedValue.toggle() }
        return Props(showingDetail: showingDetail, action: action)
    }

    static func body(props: Props) -> some View {
        NavigationView {
            VStack(spacing: 16) {
                VStack(spacing: 16) {
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
                                print(barCode)
                            }
                        }
            }
        }
    }
}
