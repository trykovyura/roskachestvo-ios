//
// Created by Юрий Трыков on 30.10.2020.
//

import SwiftUI

struct ImageDataView: View {
    let image: Image
    let loading: Bool
    var body: some View {
        image
                .resizable()
                .skeleton(with: loading)
                .shape(type: .rectangle)
                .appearance(type: .gradient())
                .animation(type: .none)
                .frame(height: 95)
                .frame(minWidth: 0, maxWidth: .infinity)
    }
}
