//
//  ViewController.swift
//  HambergerMenu
//
//  Created by Yeonu Yi on 05/10/2020.
//  Copyright © 2020 Yeonu Yi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    
    var menuVC = MenuViewController()
    var isMenuOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
    }


    @objc func menuPressed() {
        if isMenuOpened {
            animateOut()
            
            perform(#selector(removeMenu), with: nil, afterDelay: 0.9)
        } else {
            menuVC.animateIn()
            view.addSubview(menuVC.view)
            menuVC.view.frame = CGRect(x: 0, y: 0, width: 160, height: view.frame.height)
            
            //다른곳에서 셀렉터를 주면 제대로 dismiss가 안됨
            menuVC.menuOne.addTarget(self, action: #selector(goToMenu), for: .touchUpInside)
            menuButton.transform = CGAffineTransform(translationX: 160, y: 0)
        }
        isMenuOpened = !isMenuOpened
    }
    
    @objc func goToMenu() {
        isMenuOpened = !isMenuOpened
        animateOut()
        
        let vc = MenuOneViewController()
        vc.modalPresentationStyle = .fullScreen

        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func removeMenu() {
        self.menuVC.view.removeFromSuperview()
    }
    
    func animateOut() {
        self.view.transform = CGAffineTransform(translationX: 0, y: 0)
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.transform = .identity
            
            self.menuButton.transform = CGAffineTransform(translationX: 0, y: 0)
            self.menuVC.view.transform = CGAffineTransform(translationX: -160, y: 0)
        })
    }
    

}

