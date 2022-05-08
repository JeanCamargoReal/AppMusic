//
//  CardViewTableViewCell.swift
//  AppMusic
//
//  Created by Jean Camargo on 04/03/22.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {
	
	// MARK: - CONFIG
	static let identifier: String = "CardViewTableViewCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
