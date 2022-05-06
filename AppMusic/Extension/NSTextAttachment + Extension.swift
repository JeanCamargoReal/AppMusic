//
//  NSTextAttachment + Extension.swift
//  AppMusic
//
//  Created by Jean Camargo on 21/02/22.
//

import Foundation
import UIKit

extension NSTextAttachment {
	func setImageHeight(height: CGFloat) {
		guard let image = image else { return }
		
        let ratio = image.size.width / image.size.height
		
		bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
	}
}
