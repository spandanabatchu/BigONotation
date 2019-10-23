//
//  ViewController.swift
//  BigONotation
//
//  Created by Spandana Batchu on 17/10/19.
//  Copyright © 2019 Spandana Batchu. All rights reserved.
//

import UIKit
import os.signpost

class ViewController: UIViewController {
    
    @IBOutlet private weak var myStackView: UIStackView!

    let manager = PurchaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculate()
    }
    
    func calculate() {
        let calculateFatItemSignPost = OSLog(subsystem: "com.bigONotation.poc", category: "CalculateFatItem")
        
        os_signpost(.begin, log: calculateFatItemSignPost, name: "FilterMapMax")
        let width1 = getFattestVisibleItemWidth1()
        print("THE FAT ELEMENT WIDTH IS 1: \(width1!)")
        os_signpost(.end, log: calculateFatItemSignPost, name: "FilterMapMax")
        
        os_signpost(.begin, log: calculateFatItemSignPost, name: "Reduce")
        let width2 = getFattestVisibleItemWidth2()
        print("THE FAT ELEMENT WIDTH IS 2: \(width2!)")
        os_signpost(.end, log: calculateFatItemSignPost, name: "Reduce")
    }
    
    // A function that can get the width of the most fat subview thats visible inside a stack view
    //
    //https://developer.apple.com/documentation/swift/array/1688806-max
    
    func getFattestVisibleItemWidth1() -> CGFloat? {
        let w1 = myStackView.arrangedSubviews.filter { !$0.isHidden }.map{ $0.bounds.width }.max()
        return w1
    } //O(n) + O(m) + O(m)
    

    
    //https://developer.apple.com/documentation/swift/sequence/2907677-reduce
    
    func getFattestVisibleItemWidth2() -> CGFloat? {
        let w2 = myStackView.arrangedSubviews.reduce(0) { currentMax, view -> CGFloat in
            let subviewWidth = view.isHidden ? 0 : view.bounds.width
            let newMax =  max(subviewWidth, currentMax)
            return newMax
        }
        return w2
    }

}

