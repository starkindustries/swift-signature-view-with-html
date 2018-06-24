//
//  ViewController.swift
//  SwiftSignatureViewWithHTML
//
//  Created by Zion Perez on 6/24/18.
//  Copyright © 2018 Zion Perez. All rights reserved.
//
//  SwiftSignatureView
//  Created by Alankar Misra on 07/17/2015.
//  SwiftSignatureView is available under the MIT license. See the LICENSE file for more info.
//

import UIKit
import SwiftSignatureView

public class ViewController: UIViewController, SwiftSignatureViewDelegate {
    
    
    @IBOutlet weak var signatureView: SwiftSignatureView!
    // Use signatureView.signature to get at the signature image
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.signatureView.delegate = self
        let max = self.signatureView.maximumStrokeWidth
        let min = self.signatureView.minimumStrokeWidth
        print("max: \(max.description)")
        print("min: \(min.description)")
    }
    
    @IBAction func didTapClear() {
        signatureView.clear()
    }
    
    //MARK: Delegate
    
    public func swiftSignatureViewDidTapInside(_ view: SwiftSignatureView) {
        print("Did tap inside")
    }
    
    public func swiftSignatureViewDidPanInside(_ view: SwiftSignatureView) {
        print("Did pan inside")
    }
    
    // Prepare for Segue
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WebViewController {
            if let sign = signatureView.signature {
                print("signature: \(sign.description)")
            }
            destination.image = signatureView.signature
        }        
    }
}


