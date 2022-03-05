//
//  HomeViewControllerScreen.swift
//  AppMusic
//
//  Created by Jean Camargo on 23/02/22.
//

import UIKit

class HomeViewControllerScreen: UIView {
	
	lazy var tableView: UITableView = {
		let tv = UITableView()
		
		tv.separatorStyle = .none
		tv.tableFooterView = UIView()
		tv.showsVerticalScrollIndicator = false
		
		return tv
	}()
	
	public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
		self.tableView.delegate = delegate
		self.tableView.dataSource = dataSource
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.addSubview(self.tableView)
		self.setUpConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setUpConstraints() {
		self.tableView.pin(to: self)
	}
}
