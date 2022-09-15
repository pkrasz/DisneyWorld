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
        view.backgroundColor = .darkGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 15
        return view
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

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.blue.cgColor
        ]
        layer.addSublayer(gradientLayer)

    }
    
    func setupSubviews() {

        [characterImage,
        detailsView].forEach(addSubview)
    }
    
    func setupConstraints() {

        characterImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.3)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
//            make.bottom.lessThanOrEqualToSuperview()
        }
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(characterImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        
    }
    
}

