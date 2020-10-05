//
//  MenuViewController.swift
//  HambergerMenu
//
//  Created by Yeonu Yi on 05/10/2020.
//  Copyright © 2020 Yeonu Yi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var menuOne: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Menu One", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.isUserInteractionEnabled = true

        return button
    }()

    var menuTwo: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Menu Two", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.isUserInteractionEnabled = true

        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(ViewController())
        
        view.backgroundColor = .cyan
        view.addSubview(menuOne)
        menuOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        menuOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        menuOne.widthAnchor.constraint(equalToConstant: 100).isActive = true
        menuOne.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(menuTwo)
        menuTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        menuTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        menuTwo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        menuTwo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.animateIn()
    }
    
    @objc func animateIn() {
        self.view.transform = CGAffineTransform(translationX: -160, y: 0)
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.view.transform = .identity
        })
    }

}
