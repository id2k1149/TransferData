//
//  ViewControllerTwo.swift
//  TransferData
//
//  Created by Max Franz Immelmann on 1/2/23.
//

import UIKit

//MARK: - ViewControllerTwo

final class ViewControllerTwo: UIViewController {
    
    //MARK: - Private property
    
    private let label = UILabel()
    var text = ""
    
    //MARK: - Override UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        label.backgroundColor = .systemPink
        view.addSubview(label)
        
        label.text = text
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 170).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}
