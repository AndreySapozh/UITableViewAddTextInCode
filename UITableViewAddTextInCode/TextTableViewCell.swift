//
//  TextTableViewCell.swift
//  UITableViewAddTextInCode
//
//  Created by Андрей Сапожников on 30.04.2022.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    var textTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(textTitleLabel)
        configureTitleLabel()
        setTextTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(object: Text) {
        self.textTitleLabel.text = object.text
    }
    
    func configureTitleLabel()  {
        textTitleLabel.numberOfLines = 0
        textTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setTextTitleLabelConstraints() {
        textTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        textTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        textTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        textTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}

