//
//  DrawerController.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import UIKit

protocol DrawerControllerDelegate: AnyObject {
    /// Called when drawer is being dismissed.
    func drawerControllerWillDismiss(_ controller: DrawerController)

    /// Called after drawer has been dismissed.
    func drawerControllerDidDismiss(_ controller: DrawerController)
}

class DrawerController: UIViewController {
    let backgroundView = UIView()
    let drawerView = UIView()
    let contentVC: UIViewController

    public weak var delegate: DrawerControllerDelegate?

    open var preferredContentHeight: CGFloat {
        Constants.preferredContentHeight
    }
    open var maskOpacity: CGFloat {
        Constants.maskOpacity
    }

    open var animationDuration: CGFloat {
        Constants.animationDuration
    }

    open var cornerRadius: CGFloat {
        Constants.cornerRadius
    }

    open var shadowRadius: CGFloat {
        Constants.shadowRadius
    }

    init(
        contentVC: UIViewController
    ) {
        self.contentVC = contentVC

        super.init(nibName: nil, bundle: nil)

        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: {_ in
            self.drawerView.frame = CGRect(
                x: 0,
                y: self.view.bounds.height - self.preferredContentHeight,
                width: self.view.bounds.width,
                height: self.preferredContentHeight
            )
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupGesture()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if isBeingDismissed {
            delegate?.drawerControllerWillDismiss(self)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if isBeingDismissed {
            delegate?.drawerControllerDidDismiss(self)
        }
    }

    private func setupViews() {
        backgroundView.backgroundColor = .black
        backgroundView.alpha = self.maskOpacity
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(backgroundView)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])

        drawerView.frame = CGRect(
            x: 0,
            y: self.view.bounds.height - self.preferredContentHeight,
            width: self.view.bounds.width,
            height: self.preferredContentHeight
        )
        drawerView.layer.cornerRadius = self.cornerRadius
        drawerView.layer.shadowRadius = self.shadowRadius

        view.addSubview(drawerView)

        contentVC.view.layer.masksToBounds = true
        contentVC.view.layer.cornerRadius = self.cornerRadius
        contentVC.view.frame = drawerView.bounds
        drawerView.addSubview(contentVC.view)

        addChild(contentVC)
        contentVC.didMove(toParent: self)
    }

    private func setupGesture() {
        backgroundView.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(onBackgroundViewTapped))]
    }

    @objc private func onBackgroundViewTapped() {
        self.dismiss(animated: true)
    }
}

extension DrawerController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        DrawerAnimation(
            isPresenting: true,
            animationDuration: self.animationDuration,
            maskOpacity: self.maskOpacity,
            drawerView: self.drawerView,
            backgroundView: self.backgroundView
        )
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        DrawerAnimation(
            isPresenting: false,
            animationDuration: self.animationDuration,
            maskOpacity: self.maskOpacity,
            drawerView: self.drawerView,
            backgroundView: self.backgroundView
        )
    }
}

private enum Constants {
    static let preferredContentHeight: CGFloat = 300
    static let maskOpacity: CGFloat = 0.4
    static let animationDuration: CGFloat = 0.3
    static let cornerRadius: CGFloat = 20
    static let shadowRadius: CGFloat = 10
}
