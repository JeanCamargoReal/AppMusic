//
//  ViewController.swift
//  AppMusic
//
//  Created by Jean Camargo on 20/02/22.
//

import UIKit

class HomeViewController: UIViewController {
	
	// MARK: - CONFIG
	var screen: HomeViewControllerScreen?
	
	override func loadView() {
		self.screen = HomeViewControllerScreen()
		self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
		self.view = self.screen
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}


// MARK: - EXTENSIONS
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return CardData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CardViewTableViewCell.identifier, for: indexPath) as? CardViewTableViewCell
		cell?.setupCell(data: CardData[indexPath.row])
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 500
	}
}

