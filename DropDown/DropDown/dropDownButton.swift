//
//  dropDownButton.swift
//  DropDown
//
//  Created by Elliot Glaze on 04/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class dropDownButton: UIButton, DropDownProtocol {
    
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        dismissDropDown()
    }
    
    
    
    var dropView = dropDownView()
    var height = NSLayoutConstraint()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        
        dropView = dropDownView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        
        
        NSLayoutConstraint.activate([
            dropView.topAnchor.constraint(equalTo: self.bottomAnchor),
            dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dropView.widthAnchor.constraint(equalTo: self.widthAnchor),
            ])
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150{
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            NSLayoutConstraint.activate([
                self.height
                ])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        }else{
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([
                self.height
                ])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([
            self.height
            ])
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

