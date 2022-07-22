

import UIKit

extension MyFriendsController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        if operation == .push {
       return Animator()
        } else {
           return AnimatorBack()
        }
    }
    
    
}
