//
//  CustomCardView.swift
//  AppMusic
//
//  Created by Jean Camargo on 04/03/22.
//

import UIKit

enum ViewMode {
	case full
	case card
}

class CustomCardView: UIView {
	
	//MARK: - CONSTRAINTS
	var vmode: ViewMode?
	var containerLeadingConstraints: NSLayoutConstraint?
	var containerTopConstraints: NSLayoutConstraint?
	var containerTrailingConstraints: NSLayoutConstraint?
	var containerBottomConstraints: NSLayoutConstraint?
	var dataMode: CardViewModel?
	
	//MARK: - ELEMENTS
	// card view
	lazy var cardContainerView: UIView = {
		let v = UIView()
		// disabling automatic constraints
		v.translatesAutoresizingMaskIntoConstraints = false
		// rounding the edges of the card
		v.layer.cornerRadius = 30
		// changing to true to accept rounding edges
		v.clipsToBounds = true
		// shadows
		v.layer.shadowOpacity = 1
		v.layer.shadowOffset = CGSize(width: 0, height: -2)
		v.layer.shadowRadius = 20
		
		return v
	}()
	
	// image about the card
	lazy var cardImage: UIImageView = {
		let img = UIImageView()
		img.translatesAutoresizingMaskIntoConstraints = false
		// aspect image
		img.contentMode = .scaleAspectFill
		img.backgroundColor = .black

		return img
	}()
	
	// view darkens the card image
	lazy var overlayView: UIView = {
		let v = UIView()
		// disabling automatic constraints
		v.translatesAutoresizingMaskIntoConstraints = false
		// alpha component
		v.backgroundColor = UIColor.black.withAlphaComponent(0.6)
		
		return v
	}()
	
	// edges under the profile picture
	lazy var profileBorderView: UIView = {
		let v = UIView()
		// view without background
		v.backgroundColor = .clear
		// border width
		v.layer.borderWidth = 1
		// border color
		v.layer.borderColor = UIColor.white.cgColor
		// rounding
		v.layer.cornerRadius = 25
		
		return v
	}()
	
	// user image
	lazy var cardProfilePicture: UIImageView = {
		let img = UIImageView()
		img.translatesAutoresizingMaskIntoConstraints = false
		img.contentMode = .scaleAspectFill
		img.backgroundColor = .black
		img.clipsToBounds = true
		img.layer.cornerRadius = 20
		
		return img
	}()
	
	// plus image button
	lazy var addProfileImageButton: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.backgroundColor = .white
		btn.setBackgroundImage(UIImage(named: "plus"), for: .normal)
		btn.layer.cornerRadius = 10
		
		return btn
	}()
	
	// music category
	lazy var cardCategoryTitleLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.font = UIFont.systemFont(ofSize: 12, weight: .bold)
		l.textColor = .white
		
		return l
	}()
	
	// date
	lazy var cardCategoryDateLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.font = UIFont.systemFont(ofSize: 11, weight: .regular)
		l.textColor = .white
		
		return l
	}()
	
	// title
	lazy var cardTitleLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.font = UIFont.systemFont(ofSize: 31, weight: .bold)
		l.textColor = .white
		l.textAlignment = .center
		
		return l
	}()
	
	// like and time count
	lazy var likeAndTimeLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		
		return l
	}()
	
	// title description
	lazy var descriptionTitleLabel: UILabel = {
		let l = UILabel()
		l.translatesAutoresizingMaskIntoConstraints = false
		l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		l.textColor = .white
		l.textAlignment = .center
		l.numberOfLines = 0
		
		return l
	}()
	
	// MARK: - INIT
	init(viewMode: ViewMode, cardData: CardViewModel) {
		let frame = CGRect.zero
		self.vmode = viewMode
		self.dataMode = cardData
		super.init(frame: frame)
		self.addSubViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Add Elements
	private func addSubViews() {
		self.addSubview(self.cardContainerView)
		self.cardContainerView.addSubview(self.cardImage)
		self.cardContainerView.addSubview(self.overlayView)
		self.cardContainerView.addSubview(self.profileBorderView)
		self.cardContainerView.addSubview(self.cardProfilePicture)
		self.cardContainerView.addSubview(self.addProfileImageButton)
		self.cardContainerView.addSubview(self.cardCategoryTitleLabel)
		self.cardContainerView.addSubview(self.cardCategoryDateLabel)
		self.cardContainerView.addSubview(self.cardTitleLabel)
		self.cardContainerView.addSubview(self.likeAndTimeLabel)
		self.cardContainerView.addSubview(self.descriptionTitleLabel)
		self.updateLayout(for: self.vmode ?? .card)
	}
	
	// MARK: Config card if full or card
	private func updateLayout(for mode: ViewMode) {
		if mode == .full {
			self.containerLeadingConstraints?.constant = 0
			self.containerTopConstraints?.constant = 0
			self.containerBottomConstraints?.constant = 0
			self.containerTrailingConstraints?.constant = 0
			self.descriptionTitleLabel.isHidden = false
		} else {
			self.containerLeadingConstraints?.constant = 30
			self.containerTopConstraints?.constant = 15
			self.containerBottomConstraints?.constant = -15
			self.containerTrailingConstraints?.constant = -30
			self.descriptionTitleLabel.isHidden = true
		}
	}

}
