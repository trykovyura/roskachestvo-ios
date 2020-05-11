//
// Created by Юрий Трыков on 2019-02-17.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation
import IGListKit
import SnapKit
import Kingfisher

class ProductCell: UICollectionViewCell, ListBindable {

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.font.backpackBold(size: 17)
        label.textColor = R.color.doveGray()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ProductCellViewModel else {
            return
        }
        nameLabel.text = viewModel.name
        imageView.kf.setImage(with: URL(string: viewModel.image)!)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(view)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 4
        view.addSubview(nameLabel)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
            make.trailing.lessThanOrEqualToSuperview()
            make.top.lessThanOrEqualToSuperview()
            make.bottom.greaterThanOrEqualToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}