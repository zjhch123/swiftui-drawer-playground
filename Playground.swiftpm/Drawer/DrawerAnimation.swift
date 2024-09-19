//
//  DrawerAnimation.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import UIKit

class DrawerAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    let isPresenting: Bool
    let animationDuration: CGFloat
    let maskOpacity: CGFloat
    let drawerView: UIView
    let backgroundView: UIView

    init(isPresenting: Bool, animationDuration: CGFloat, maskOpacity: CGFloat, drawerView: UIView, backgroundView: UIView) {
        self.isPresenting = isPresenting
        self.animationDuration = animationDuration
        self.maskOpacity = maskOpacity
        self.drawerView = drawerView
        self.backgroundView = backgroundView
    }

    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        self.animationDuration
    }

    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        if isPresenting {
            self.presenting(transitionContext)
        } else {
            self.dismissing(transitionContext)
        }
    }

    private func presenting(_ transitionContext: UIViewControllerContextTransitioning) {
        guard let to = transitionContext.view(forKey: .to) else {
            return
        }

        transitionContext.containerView.addSubview(to)

        self.backgroundView.alpha = 0
        self.drawerView.frame.origin.y += self.drawerView.frame.height

        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                self.backgroundView.alpha = self.maskOpacity
                self.drawerView.frame.origin.y -= self.drawerView.frame.height
            },
            completion: { finished in
                transitionContext.completeTransition(finished)
            }
        )
    }

    private func dismissing(_ transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else {
            return
        }

        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                self.backgroundView.alpha = 0
                self.drawerView.frame.origin.y += self.drawerView.frame.height
            },
            completion: { finished in
                transitionContext.completeTransition(finished)
                fromView.removeFromSuperview()
            }
        )
    }
}
