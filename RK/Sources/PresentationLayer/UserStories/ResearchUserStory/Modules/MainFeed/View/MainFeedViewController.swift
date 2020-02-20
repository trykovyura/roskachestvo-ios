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
        collectionView.backgroundColor = .clear
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

    lazy var topView: UIView = {
        let view = LTView()
        view.horizontalGradient = true
        view.firstColor = R.color.ghost1()!
        view.secondColor = R.color.ghost2()!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didTriggerViewReady()
    }

    // MARK: MainFeedViewInput
    func setupInitialState() {
        view.addSubview(topView)
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        configureViewConstraints()
        navigationItem.title = R.string.localizable.categoryTitle()
        view.backgroundColor = R.color.athensGray()
    }

    func configureViewConstraints() {
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(170)
        }
        collectionView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.top.equalTo(self.topLayoutGuide.snp.bottom)
                make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            }
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
     }

    func configureWith(categories: [CategoriesPlainObject]) {
        dataDisplayManager.configure(categories: categories)
        adapter.performUpdates(animated: true)
    }
}

extension MainFeedViewController: MainFeedDataDisplayManagerOutput {
    func didSelectResearch(with id: String) {
        output.didTriggerResearch(with: id)
    }

    func didSelectCategory(with id: String) {
        output.didTriggerCategory(with: id)
    }
}
