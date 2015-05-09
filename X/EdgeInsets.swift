//
//  EdgeInsets.swift
//  X
//
//  Created by Sam Soffes on 5/8/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS)
	import UIKit
	public typealias EdgeInsets = UIEdgeInsets
#else
	import AppKit
	public typealias EdgeInsets = NSEdgeInsets
#endif


extension EdgeInsets {
	public func insetRect(rect: CGRect) -> CGRect {
		#if os(iOS)
			return UIEdgeInsetsInsetRect(rect, self)
		#else
			if (insets.top + insets.bottom > rect.size.height) || (insets.left + insets.right > rect.size.width) {
				return CGRectNull
			}

			var insetRect = rect
			insetRect.origin.x += insets.left
			insetRect.origin.y += insets.top;
			insetRect.size.height -= insets.top + insets.bottom
			insetRect.size.width -= insets.left + insets.right
			return insetRect
		#endif
	}
}