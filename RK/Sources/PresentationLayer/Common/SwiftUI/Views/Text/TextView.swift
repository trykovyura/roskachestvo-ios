//
// Created by Юрий Трыков on 30.10.2020.
//

import SwiftUI

struct TextView: View {
    let name: String
    let loading: Bool

    var body: some View {
        Text(name)
                .font(.system(size: 12.0, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
    }
}
