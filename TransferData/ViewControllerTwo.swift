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
    private let button = UIButton()
    
    // to return text
    var completion: ((String) -> ())?
    
    // to get text
    var text = ""
    
    //MARK: - Override UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.backgroundColor = .systemPink
        label.text = text
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 170).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.backgroundColor = .black
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.addTarget(self, action: #selector(returnBack), for: .touchUpInside)
    }
    
    @objc
    private func returnBack() {
        // to return text
        completion?("some text")
        
        // close view
        dismiss(animated: true)
    }
}
