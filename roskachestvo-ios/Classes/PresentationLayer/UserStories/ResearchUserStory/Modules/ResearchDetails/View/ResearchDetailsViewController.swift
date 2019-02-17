//
//  ResearchDetailsResearchDetailsViewController.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

class ResearchDetailsViewController: UIViewController, ResearchDetailsViewInput {

    var output: ResearchDetailsViewOutput!
    var dataDisplayManager: ResearchDetailsDataDisplayManager!

    lazy var collectionView: UICollectionView = {
        let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    /// Abstract manager for building main elements
    lazy var adapter: ListAdapter = { [unowned self] in
        let listAdapter: ListAdapter = ListAdapter(updater: ListAdapterUpdater(),
                viewController: self,
                workingRangeSize: 3)
        listAdapter.dataSource = self.dataDisplayManager
        return listAdapter
    }()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didTriggerViewReady()
    }

    // MARK: ResearchDetailsViewInput
    func setupInitialState() {
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        configureViewConstraints()
    }

    func configureViewConstraints() {
        collectionView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.top.equalTo(self.topLayoutGuide.snp.bottom)
                make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            }
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

    func configure(with research: ResearchPlainObject) {
        dataDisplayManager.configure(research: research)
        adapter.performUpdates(animated: true)
    }
}

extension ResearchDetailsViewController: ResearchDetailsDataDisplayManagerOutput {

}
