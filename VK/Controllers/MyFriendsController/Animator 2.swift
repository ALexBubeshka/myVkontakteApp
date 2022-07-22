//
//  Animator.swift
//  VK
//
//  Created by Alexander Bubeshka on 2.07.22.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let durationTimeInterval: Double = 2
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return durationTimeInterval
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let sourceVC = transitionContext.viewController(forKey: .from),
              let destinationVC = transitionContext.viewController(forKey: .to)
        else {return}
        
        let sourceSuperView = sourceVC.view.superview
        let destinationView = destinationVC.view
        let duration = transitionDuration(using: transitionContext)
        sourceSuperView?.addSubview(destinationView!)
        
        let frameHeight = destinationView?.frame.height
        let frameWidth = destinationView?.frame.width
        let pos = frameHeight! / 2 + frameWidth! / 2
        destinationView?.transform = CGAffineTransform(rotationAngle: .pi / -2).concatenating(CGAffineTransform(translationX: pos, y: -pos))
        
        UIView.animate(withDuration: duration / 2) {
            destinationView?.transform = .identity
        } completion: { isSuccessfully in
            transitionContext.completeTransition(isSuccessfully)
        }
    }
}

    
