//
// Created by Юрий Трыков on 20.06.2020.
//

import SwiftUI

struct AboutView: ConnectedView {
    struct Props {
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        Props()
    }

    static func body(props: Props) -> some View {
        ScrollView {
            VStack(spacing: 15) {
                R.string.localizable.aboutSection1Text.text
                        .aboutTextStyle()
                R.image.octocat.image
                Button(action: {
                    UIApplication.shared.open(URL(string: R.string.localizable
                            .githubLink())!)
                }, label: {
                    (R.string.localizable.aboutSection2Prefix.text +
                            R.string.localizable.aboutSection2Link.text
                                    .underline() +
                            R.string.localizable.aboutSection2Suffix.text)
                            .aboutTextStyle()
                })
                Divider()
                        .frame(width: 220)
                        .foregroundColor(R.color.viridianGreen.color)
                Button(action: {
                    UIApplication.shared.open(URL(string: R.string.localizable
                            .rkLink())!)
                }, label: {
                    (R.string.localizable.aboutSection3Prefix.text +
                            R.string.localizable.aboutSection3Link.text
                                    .underline() +
                            R.string.localizable.aboutSection3Suffix.text)
                            .aboutTextStyle()
                })
                Divider()
                        .frame(width: 220)
                        .foregroundColor(R.color.viridianGreen.color)
            }
            .offset(y: 50)
        }
    }
}

extension Text {
    public func aboutTextStyle() -> some View {
        self.font(.subheadline)
                .foregroundColor(R.color.gray.color)
                .padding([.leading, .trailing], 30)
                .multilineTextAlignment(.center)
    }
}
