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
	
	// MARK: - INIT
    init(mode: ViewMode) {
		let frame = CGRect.zero
		super.init(frame: frame)
		self.addSubViews()
		self.setUpConstraints()
        self.updateLayout(for: mode)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - SETUP CONSTRAINTS
	
	// NSLayoutConstraint
	var containerLeadingConstraints: NSLayoutConstraint?
	var containerTopConstraints: NSLayoutConstraint?
	var containerTrailingConstraints: NSLayoutConstraint?
	var containerBottomConstraints: NSLayoutConstraint?
	var dataMode: CardViewModel?
	
	// setup
	private func setUpConstraints() {
		self.containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
		self.containerLeadingConstraints?.isActive = true
		
		self.containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
		self.containerTopConstraints?.isActive = true
		
		self.containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
		self.containerBottomConstraints?.isActive = true
		
		self.containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
		self.containerTrailingConstraints?.isActive = true
		
		self.overlayView.pin(to: self.cardContainerView)
		self.cardImage.pin(to: self.cardContainerView)
		
		NSLayoutConstraint.activate([
			self.profileBorderView.topAnchor.constraint(equalTo: self.cardContainerView.topAnchor, constant: 60),
			self.profileBorderView.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
			self.profileBorderView.widthAnchor.constraint(equalToConstant: 50),
			self.profileBorderView.heightAnchor.constraint(equalToConstant: 50),
			
			self.addProfileImageButton.trailingAnchor.constraint(equalTo: self.profileBorderView.trailingAnchor, constant: 4),
			self.addProfileImageButton.bottomAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 4),
			self.addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
			self.addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
			
			self.cardProfilePicture.centerXAnchor.constraint(equalTo: self.profileBorderView.centerXAnchor),
			self.cardProfilePicture.centerYAnchor.constraint(equalTo: self.profileBorderView.centerYAnchor),
			self.cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
			self.cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
			
			self.cardCategoryTitleLabel.topAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 10),
			self.cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
			
			self.cardCategoryDateLabel.topAnchor.constraint(equalTo: self.cardCategoryTitleLabel
				.bottomAnchor, constant: 2),
			self.cardCategoryDateLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
			
			self.cardTitleLabel.topAnchor.constraint(equalTo: self.cardCategoryDateLabel.bottomAnchor, constant: 20),
			self.cardTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
			self.cardTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
			
			self.likeAndTimeLabel.topAnchor.constraint(equalTo: self.cardTitleLabel.bottomAnchor, constant: 10),
			self.likeAndTimeLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
			
			self.descriptionTitleLabel.topAnchor.constraint(equalTo: self.likeAndTimeLabel.bottomAnchor, constant: 30),
			self.descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 40),
			self.descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -40),
			
			self.actionsView.bottomAnchor.constraint(equalTo: self.cardContainerView.bottomAnchor, constant: -20),
			self.actionsView.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
			self.actionsView.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
			self.actionsView.heightAnchor.constraint(equalToConstant: 80),
		])
	}
	
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
	
	lazy var actionsView: CardActionView = {
		let v = CardActionView()
		v.translatesAutoresizingMaskIntoConstraints = false
		
		return v
	}()
		
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
		self.cardContainerView.addSubview(self.actionsView)
	}
	
	// MARK: - Config card if full or card
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
		self.actionsView.updateLayout(for: mode)
	}
	
	public func setupView(data: CardViewModel) {
		self.cardCategoryTitleLabel.text = data.categoryName
		self.cardCategoryDateLabel.text = data.categoryDate
		self.cardTitleLabel.text = data.cardTitle
		self.likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
		self.descriptionTitleLabel.text = data.cardDescription
		self.cardImage.image = UIImage(named: data.cardImage ?? "")
		self.cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
	}
}
