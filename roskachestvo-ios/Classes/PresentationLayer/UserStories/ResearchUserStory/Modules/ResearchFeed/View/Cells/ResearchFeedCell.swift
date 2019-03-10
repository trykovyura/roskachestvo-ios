//
//  ResearchFeedResearchFeedCell.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit
import SnapKit

class ResearchFeedCell: UICollectionViewCell, ListBindable {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ResearchFeedCellViewModel else {
            return
        }
        nameLabel.text = viewModel.name
    }

   override init(frame: CGRect) {
       super.init(frame: frame)
       contentView.addSubview(nameLabel)
       nameLabel.snp.makeConstraints { make in
           make.edges.equalToSuperview()
       }
   }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}