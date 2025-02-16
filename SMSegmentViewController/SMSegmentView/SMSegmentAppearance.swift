//
//  SMSegmentAppearance.swift
//  SMSegmentViewController
//
//  Created by Si MA on 11/07/2016.
//  Copyright © 2016 si.ma. All rights reserved.
//

import UIKit

open class SMSegmentAppearance {
	
	// PROPERTIES
	open var segmentOnSelectionColour: UIColor
	open var segmentOffSelectionColour: UIColor
    open var segmentImageScale: UIView.ContentMode
    open var segmentMultiSelect: Bool = false
	
	open var segmentTouchDownColour: UIColor {
		get {
			var onSelectionHue: CGFloat = 0.0
			var onSelectionSaturation: CGFloat = 0.0
			var onSelectionBrightness: CGFloat = 0.0
			var onSelectionAlpha: CGFloat = 0.0
			
			self.segmentOnSelectionColour.getHue(&onSelectionHue, saturation: &onSelectionSaturation, brightness: &onSelectionBrightness, alpha: &onSelectionAlpha)
			
			var offSelectionHue: CGFloat = 0.0
			var offSelectionSaturation: CGFloat = 0.0
			var offSelectionBrightness: CGFloat = 0.0
			var offSelectionAlpha: CGFloat = 0.0
			self.segmentOffSelectionColour.getHue(&offSelectionHue, saturation: &offSelectionSaturation, brightness: &offSelectionBrightness, alpha: &offSelectionAlpha)
			
			return UIColor(hue: onSelectionHue, saturation: (onSelectionSaturation + offSelectionSaturation)/2.0, brightness: (onSelectionBrightness + offSelectionBrightness)/2.0, alpha: (onSelectionAlpha + offSelectionAlpha)/2.0)
		}
	}
	
	open var titleOnSelectionColour: UIColor
	open var titleOffSelectionColour: UIColor
	
	open var titleOnSelectionFont: UIFont
	open var titleOffSelectionFont: UIFont
	
	open var titleGravity: SMSTitleGravity
	
	open var contentVerticalMargin: CGFloat
	
	
	// INITIALISER
	public init() {
		
		self.segmentOnSelectionColour = UIColor.darkGray
		self.segmentOffSelectionColour = UIColor.gray
        self.segmentImageScale = .scaleAspectFit
		
		self.titleOnSelectionColour = UIColor.white
		self.titleOffSelectionColour = UIColor.darkGray
		self.titleOnSelectionFont = UIFont.systemFont(ofSize: 17.0)
		self.titleOffSelectionFont = UIFont.systemFont(ofSize: 17.0)
		self.titleGravity = SMSTitleGravity.right
		
		self.contentVerticalMargin = 5.0
	}
	
	public init(contentVerticalMargin: CGFloat, segmentOnSelectionColour: UIColor, segmentOffSelectionColour: UIColor, titleOnSelectionColour: UIColor, titleOffSelectionColour: UIColor, titleOnSelectionFont: UIFont, titleOffSelectionFont: UIFont, titleGravity: SMSTitleGravity?) {
		
		self.contentVerticalMargin = contentVerticalMargin
		
		self.segmentOnSelectionColour = segmentOnSelectionColour
		self.segmentOffSelectionColour = segmentOffSelectionColour
        self.segmentImageScale = .scaleAspectFit
		
		self.titleOnSelectionColour = titleOnSelectionColour
		self.titleOffSelectionColour = titleOffSelectionColour
		self.titleOnSelectionFont = titleOnSelectionFont
		self.titleOffSelectionFont = titleOffSelectionFont
		
		if let gravity = titleGravity {
			self.titleGravity = gravity
		} else {
			self.titleGravity = .right
		}
	}
}
