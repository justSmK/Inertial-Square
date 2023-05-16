//
//  ViewController.swift
//  Inertial Square
//
//  Created by Sergei Semko on 5/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var squareView: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 128, height: 128)
        view.center = self.view.center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .link
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var animator = UIDynamicAnimator(referenceView: view)
    lazy var snapBehavior = UISnapBehavior(item: squareView, snapTo: squareView.center)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(squareView)
        
        let moveView = UITapGestureRecognizer(target: self, action: #selector(moveViewTapped))
        view.addGestureRecognizer(moveView)
        snapBehavior.damping = 1
        animator.addBehavior(snapBehavior)
    }

    @objc private func moveViewTapped(_ recognizer: UITapGestureRecognizer) {
        snapBehavior.snapPoint = recognizer.location(in: view)
    }

}

