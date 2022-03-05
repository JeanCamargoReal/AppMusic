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
	
	//MARK: - PROPRIEDADES
	var vmode: ViewMode?
	var containerLeadingConstraints: NSLayoutConstraint?
	var containerTopConstraints: NSLayoutConstraint?
	var containerTrailingConstraints: NSLayoutConstraint?
	var containerBottomConstraints: NSLayoutConstraint?
	var dataMode: CardViewModel?
	
	//MARK: - ELEMENTOS
	//view do card
	lazy var cardContainerView: UIView = {
		let v = UIView()
		// desabilitando constraints automáticas
		v.translatesAutoresizingMaskIntoConstraints = false
		// arredondamento das bordas do card
		v.layer.cornerRadius = 30
		// alterando para true para aceitar arredondar as bordas
		v.clipsToBounds = true
		// sombras
		v.layer.shadowOpacity = 1
		v.layer.shadowOffset = CGSize(width: 0, height: -2)
		v.layer.shadowRadius = 20
		
		return v
	}()
	
	//imagem sobre o card como um todo
	lazy var cardImage: UIImageView = {
		let img = UIImageView()
		
		img.translatesAutoresizingMaskIntoConstraints = false
		// aspecto da imagem
		img.contentMode = .scaleAspectFill
		img.backgroundColor = .black
		
		return img
	}()
	
	// view que escurece a imagem do card
	lazy var overlayView: UIView = {
		let v = UIView()
		// desabilitando constraints automáticas
		v.translatesAutoresizingMaskIntoConstraints = false
		// transparencia
		v.backgroundColor = UIColor.black.withAlphaComponent(0.6)
		
		return v
	}()
	
	// bordas que fica sob a imagem de perfil
	lazy var profileBorderView: UIView = {
		let v = UIView()
		// deixando a view sem background
		v.backgroundColor = .clear
		// expessura da borda
		v.layer.borderWidth = 1
		// cor da borda
		v.layer.borderColor = UIColor.white.cgColor
		// arredondando
		v.layer.cornerRadius = 25
		
		return v
	}()
	
	// imagem do usuário
	lazy var cardProfilePicture: UIImageView = {
		let img = UIImageView()
		
		img.translatesAutoresizingMaskIntoConstraints = false
		img.contentMode = .scaleAspectFill
		img.backgroundColor = .black
		img.clipsToBounds = true
		img.layer.cornerRadius = 20
		
		return img
	}()
	
	// botão de adicionar imagem do usuário (botão plus)
	lazy var addProfileImageButton: UIButton = {
		let btn = UIButton()
		
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.backgroundColor = .white
		btn.setBackgroundImage(UIImage(named: "plus"), for: .normal)
		btn.layer.cornerRadius = 10
		
		return btn
	}()

}
