//
//  ViewController.swift
//  Psychologist
//
//  Created by chenjs on 15/4/2.
//  Copyright (c) 2015年 TOMMY. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    private struct Constants {
        static let ShowSadDiagnosisSegue = "Show sad diagnosis"
        static let ShowHappyDiagnosisSegue = "Show happy diagnosis"
        static let ShowLittleSadDiagnosisSegue = "Show little sad diagnosis"
        static let ShowNothingDiagnosisSegue = "Show nothing diagnosis"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let hvc = (segue.destinationViewController as? UIViewController)?.contentViewController as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case Constants.ShowSadDiagnosisSegue:
                    hvc.happiness = 0
                case Constants.ShowHappyDiagnosisSegue:
                    hvc.happiness = 100
                case Constants.ShowLittleSadDiagnosisSegue:
                    hvc.happiness = 25
                case Constants.ShowNothingDiagnosisSegue:
                    hvc.happiness = 15
                default:
                    hvc.happiness = 50
                }
            }
        }
    }
    
    @IBAction func showNothingDiagnosis(sender: UIButton) {
        performSegueWithIdentifier(Constants.ShowNothingDiagnosisSegue, sender: nil)
    }
}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navCon = self as? UINavigationController {
            return navCon.visibleViewController
        } else {
            return self
        }
    }
}

