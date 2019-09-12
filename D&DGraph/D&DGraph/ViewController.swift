//
//  ViewController.swift
//  D&DGraph
//
//  Created by Yoann PARISET on 12/09/2019.
//  Copyright © 2019 Yoann PARISET. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var  location = CGPoint(x: 0, y: 0)
    
    @IBOutlet var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var view = UIView()
        view = Canvas.shared.backingView
        
        container.addSubview(view)
        
        run()
        draggableCircle()
    }

    
    
    
    
    func run() {
        let width = Canvas.shared.visibleSize.width
        let heigth = Canvas.shared.visibleSize.height
        print("width = \(width), heigth = \(heigth)")
}

    
    // Draw a circle with changing color which is dragged to the touch point
    func draggableCircle() {
        // create a circle and make it draggable.
        let circle = Circle(radius: 7.0)
        circle.color = Color.purple
        circle.center = .init(x: 35, y: -20)
        circle.draggable = true
        
        // when the circle is touched, make it darker and give it a shadow.
        circle.onTouchDown {
            circle.color = circle.color.darker()
            circle.dropShadow = Shadow()
        }
        
        // when the touch ends on the circle, change its color to a random color.
        circle.onTouchUp {
            circle.color = Color.random()
            circle.dropShadow = nil
        }
        
        // jump the circle to the the point on the canvas that was touched.
        Canvas.shared.onTouchUp {
            circle.center = Canvas.shared.currentTouchPoints.first!
            circle.dropShadow = Shadow()
        }
        
       
        }
    }


