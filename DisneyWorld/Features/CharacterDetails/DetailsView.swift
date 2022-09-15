//
//  DetailsView.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import UIKit

class DetailsView: UIView {
    
    
    //MARK: - Subview
    
    let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Constants.name)
        label.textColor = .white
        label.text = "Name:"
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.name)
        label.textColor = .white
        return label
    }()
    
    let filmsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Constants.details)
        label.textColor = .white
        label.text = "Films:"
        return label
    }()
    
    let filmsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.details)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let shortFilmsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Constants.details)
        label.textColor = .white
        label.text = "Short films:"
        return label
    }()
    
    let shortFilmsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.details)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let tvShowsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Constants.details)
        label.textColor = .white
        label.text = "TV shows:"
        return label
    }()
    
    let tvShowsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.details)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let videoGamesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Constants.details)
        label.textColor = .white
        label.text = "Video games:"
        return label
    }()
    
    let videoGamesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.details)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let parkAttractionsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Constants.details)
        label.textColor = .white
        label.text = "Park attractions:"
        return label
    }()
    
    let parkAttractionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.details)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let alliesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Constants.details)
        label.textColor = .white
        label.text = "Allies:"
        return label
    }()
    
    let alliesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.details)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let enemiesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Constants.details)
        label.textColor = .white
        label.text = "Enemies:"
        return label
    }()
    
    let enemiesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.details)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    
    //MARK: - Initializator
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupSubviews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setupView() {
    }
    
    func setupSubviews() {
        
        [nameTitleLabel,
         nameLabel,
         filmsTitleLabel,
         filmsLabel,
         shortFilmsTitleLabel,
         shortFilmsLabel,
        tvShowsTitleLabel,
        tvShowsLabel,
        videoGamesTitleLabel,
        videoGamesLabel,
        parkAttractionsTitleLabel,
        parkAttractionsLabel,
        alliesTitleLabel,
        alliesLabel,
        enemiesTitleLabel,
        enemiesLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        
        nameTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.plusMargin)
            make.leading.equalToSuperview().offset(Constants.plusMargin)
            make.bottom.equalTo(nameLabel.snp.bottom)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTitleLabel.snp.top)
            make.leading.equalTo(nameTitleLabel.snp.trailing).offset(Constants.afterTitleSpace)
            make.trailing.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
        }
        
        filmsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Constants.plusMargin)
            make.leading.equalToSuperview().offset(Constants.plusMargin)
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        filmsLabel.snp.makeConstraints { make in
            make.top.equalTo(filmsTitleLabel.snp.top)
            make.leading.equalTo(filmsTitleLabel.snp.trailing).offset(Constants.afterTitleSpace)
            make.trailing.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        shortFilmsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(filmsLabel.snp.bottom).offset(Constants.lineSpacing)
            make.leading.equalTo(filmsTitleLabel.snp.leading)
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        shortFilmsLabel.snp.makeConstraints { make in
            make.top.equalTo(shortFilmsTitleLabel.snp.top)
            make.leading.equalTo(shortFilmsTitleLabel.snp.trailing).offset(Constants.afterTitleSpace)
            make.trailing.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        tvShowsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(shortFilmsLabel.snp.bottom).offset(Constants.lineSpacing)
            make.leading.equalTo(shortFilmsTitleLabel.snp.leading)
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        tvShowsLabel.snp.makeConstraints { make in
            make.top.equalTo(tvShowsTitleLabel.snp.top)
            make.leading.equalTo(tvShowsTitleLabel.snp.trailing).offset(Constants.afterTitleSpace)
            make.trailing.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        videoGamesTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(tvShowsLabel.snp.bottom).offset(Constants.lineSpacing)
            make.leading.equalTo(tvShowsTitleLabel.snp.leading)
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        videoGamesLabel.snp.makeConstraints { make in
            make.top.equalTo(videoGamesTitleLabel.snp.top)
            make.leading.equalTo(videoGamesTitleLabel.snp.trailing).offset(Constants.afterTitleSpace)
            make.trailing.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        parkAttractionsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(videoGamesLabel.snp.bottom).offset(Constants.lineSpacing)
            make.leading.equalTo(videoGamesTitleLabel.snp.leading)
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        parkAttractionsLabel.snp.makeConstraints { make in
            make.top.equalTo(parkAttractionsTitleLabel.snp.top)
            make.leading.equalTo(parkAttractionsTitleLabel.snp.trailing).offset(Constants.afterTitleSpace)
            make.trailing.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        alliesTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(parkAttractionsLabel.snp.bottom).offset(Constants.lineSpacing)
            make.leading.equalTo(parkAttractionsTitleLabel.snp.leading)
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        alliesLabel.snp.makeConstraints { make in
            make.top.equalTo(alliesTitleLabel.snp.top)
            make.leading.equalTo(alliesTitleLabel.snp.trailing).offset(Constants.afterTitleSpace)
            make.trailing.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        enemiesTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(alliesLabel.snp.bottom).offset(Constants.lineSpacing)
            make.leading.equalTo(alliesTitleLabel.snp.leading)
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        enemiesLabel.snp.makeConstraints { make in
            make.top.equalTo(enemiesTitleLabel.snp.top)
            make.leading.equalTo(enemiesTitleLabel.snp.trailing).offset(Constants.afterTitleSpace)
            make.trailing.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
            make.bottom.lessThanOrEqualToSuperview().offset(Constants.minusMargin)
        }
    }
}

    //MARK: - Extension

extension DetailsView {
    enum Constants {
        static let name: CGFloat = 25
        static let details: CGFloat = 15
        static let plusMargin: CGFloat = 30
        static let minusMargin: CGFloat = -30
        static let afterTitleSpace: CGFloat = 10
        static let lineSpacing: CGFloat = 10
    }
}

