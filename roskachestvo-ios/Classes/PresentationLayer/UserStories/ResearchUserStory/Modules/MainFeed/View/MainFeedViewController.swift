//
//  MainFeedMainFeedViewController.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

class MainFeedViewController: UIViewController, MainFeedViewInput {

    var output: MainFeedViewOutput!
    var dataDisplayManager: MainFeedDataDisplayManager!

    lazy var collectionView: UICollectionView = {
        let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = R.color.athensGray()
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

    // MARK: MainFeedViewInput
    func setupInitialState() {
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        configureViewConstraints()
        navigationItem.title = "Исследования"
        view.backgroundColor = R.color.athensGray()
    }

    func configureViewConstraints() {
        collectionView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.top.equalToSuperview()
                make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            }
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
     }

    func configureWith(categories: [CategoriesPlainObject]) {
        dataDisplayManager.configure(categories: categories)
        adapter.performUpdates(animated: true)
    }
}

extension MainFeedViewController: MainFeedDataDisplayManagerOutput {

}
