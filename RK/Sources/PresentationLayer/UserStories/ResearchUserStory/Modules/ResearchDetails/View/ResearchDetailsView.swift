//
// Created by Юрий Трыков on 11.07.2020.
//

import SwiftUI

struct ResearchDetailsView: UIViewControllerRepresentable {

    let researchId: String

    func makeUIViewController(context: Context) -> ResearchDetailsViewController {
        let vc: ResearchDetailsViewController = R.storyboard.researchDetails.instantiateInitialViewController()!
        if let presenter = vc.output as? ResearchDetailsPresenter {
            presenter.researchId = researchId
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: ResearchDetailsViewController, context: Context) {
    }
}
