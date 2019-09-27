//
//  MusicListTableViewCell.swift
//  ShuffleSongs
//
//  Created by Eduardo Sanches Bocato on 27/09/19.
//  Copyright © 2019 Bocato. All rights reserved.
//

import UIKit

final class MusicListTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.lineBreakMode = .byClipping
        label.apply(typography: .cellTitle, with: .reddish)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.lineBreakMode = .byClipping
        label.apply(typography: .cellSubtitle, with: .white)
        return label
    }()
    
    private lazy var textStackView: UIStackView = {
        return StackViewBuilder {
            $0.arrangedSubviews = [
                titleLabel,
                subtitleLabel
            ]
            $0.spacing = Metrics.Margin.tiny
            $0.axis = .vertical
            $0.distribution = .fill
        }.build()
    }()
    
    private lazy var artworkImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.isHidden = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var contentStackView: UIStackView = {
        return StackViewBuilder {
            $0.arrangedSubviews = [
                textStackView
            ]
            $0.spacing = Metrics.Margin.default
            $0.axis = .vertical
            $0.distribution = .fill
        }.build()
    }()
    
    // MARK: - Dependencies
    
    private var viewModel: MusicListTableViewCellViewModelProtocol?
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: nil)
        setupLayout()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel?.cancelImageRequest()
    }
    
    // MARK: - Configuration
    
    /// Configures the cell with a viewData object of type `MusicInfoItem`
    func configure(with viewModel: MusicListTableViewCellViewModelProtocol) {
        self.viewModel = viewModel
        setupViewData()
    }
    
    // MARK: - Setup
    
    private func setupLayout() {
        backgroundColor = .darkPurple
        addSubViews()
    }
    
    private func setupViewData() {
        viewModel?.fetchImage{ [artworkImageView] image in
            UIView.transition(
                with: artworkImageView,
                duration: 0.25, options: [.curveEaseIn],
                animations: {
                    artworkImageView.image = image
            })
        }
    }
    
    // MARK: - Layout
    
    private func addSubViews() {
        constrainStackView()
    }
    
    private func constrainStackView() {
        
    }
    
}
