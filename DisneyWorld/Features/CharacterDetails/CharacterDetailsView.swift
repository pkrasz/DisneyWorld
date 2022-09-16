//
//  CharacterDetailsView.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import UIKit
import SnapKit

class CharacterDetailsView: UIView {

    //MARK: - Subview

    let characterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .darkGray.withAlphaComponent(0.5)
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
        
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    var detailsView: DetailsView = {
        let view = DetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .darkGray.withAlphaComponent(0.5)
        scrollView.layer.cornerRadius = 15
        return scrollView
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = .blue
        activityIndicator.isHidden = false
        return activityIndicator
    }()
    
    
    //MARK: - Initializator
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupScrollview()
        setupView()
        setupSubviews()
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setupView() {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.blue.cgColor
        ]
        layer.addSublayer(gradientLayer)

    }
    
    func setupScrollview() {
        scrollView.addSubview(detailsView)
    }
    
    func setupSubviews() {

        [characterImage,
        scrollView,
        activityIndicatorView].forEach(addSubview)
    }
    
    func setupConstraints() {

        characterImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.3)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(characterImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-40)
        }
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.width.equalToSuperview().offset(-40)
        }
        
        activityIndicatorView.snp.makeConstraints { make in
            make.centerX.equalTo(characterImage.snp.centerX)
            make.centerY.equalTo(characterImage.snp.centerY)
        }
    }
    
}

