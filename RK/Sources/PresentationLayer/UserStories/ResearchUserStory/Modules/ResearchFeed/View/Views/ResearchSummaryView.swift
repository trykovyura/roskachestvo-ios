//
// Created by Юрий Трыков on 2019-03-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit
import SnapKit

class ResearchSummaryView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var qualityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textColor = UIColor.TextColor.Red.terracotta
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var highQualityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textColor = UIColor.TextColor.Yellow.buttercup
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var withSignLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = UIColor.TextColor.Gray.silverChalice
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var withViolationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(qualityLabel)
        stackView.addArrangedSubview(highQualityLabel)
        stackView.addArrangedSubview(withSignLabel)
        stackView.addArrangedSubview(withViolationLabel)
    }

    private func configureConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func configure(with summary: ResearchSummary?) {
        guard let summary = summary else {
            qualityLabel.text = "K 0"
            highQualityLabel.text = "0"
            withSignLabel.text = "! 0"
            return
        }
        qualityLabel.text = "K " + (summary.quality ?? "0")
        highQualityLabel.text = summary.highQuality
        withSignLabel.text = "! " + (summary.withSign ?? "0")
    }
}
