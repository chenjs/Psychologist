//
//  TextViewController.swift
//  Psychologist
//
//  Created by chenjs on 15/4/5.
//  Copyright (c) 2015年 TOMMY. All rights reserved.
//

import UIKit

class TextViewController: UIViewController
{
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                var size = presentingViewController!.view.bounds.size
                size.width = size.width / 2
                return textView.sizeThatFits(size)
            } else {
                return super.preferredContentSize
            }
        }
        set {
            super.preferredContentSize = newValue
        }
    }

}
