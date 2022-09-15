//
//  CharactersView.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import UIKit
import SnapKit

class CharactersView: UIView {

    //MARK: - Subview
    
    let charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
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
        backgroundColor = .systemCyan
    }
    
    func setupSubviews() {
        addSubview(charactersTableView)
    }
    
    func setupConstraints() {
        charactersTableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
}
