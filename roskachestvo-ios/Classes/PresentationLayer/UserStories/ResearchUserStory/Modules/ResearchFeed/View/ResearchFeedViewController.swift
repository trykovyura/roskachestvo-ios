//
//  ResearchFeedResearchFeedViewController.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

class ResearchFeedViewController: UIViewController, ResearchFeedViewInput {

    var output: ResearchFeedViewOutput!
    var dataDisplayManager: ResearchFeedDataDisplayManager!

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

    // MARK: ResearchFeedViewInput
    func setupInitialState() {
        view.addSubview(topView)
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        configureViewConstraints()
        navigationItem.title = R.string.localizable.researchTitle()
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

    func configureWith(researches: [ResearchesPlainObject]) {
        dataDisplayManager.configure(researches: researches)
        adapter.performUpdates(animated: true)
    }
}

extension ResearchFeedViewController: ResearchFeedDataDisplayManagerOutput {

    func didSelectResearch(with id: String) {
        output.didTriggerResearch(with: id)
    }
}
