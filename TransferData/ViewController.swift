//
//  ViewController.swift
//  TransferData
//
//  Created by Max Franz Immelmann on 1/2/23.
//

import UIKit

//MARK: - ViewController

final class ViewController: UIViewController {
    
    //MARK: - Private property
    
    private let label = UILabel()
    private let textfield = UITextField()
    private let button = UIButton()

    //MARK: - Override UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View

private extension ViewController {
    
    func setupView() {
        setupSelfView()
        
        addViews()
        
        setupLabel()
        setupTextField()
        setupButton()
        
        layout()
    }
}

//MARK: - Setup Views

private extension ViewController {
    func setupSelfView() {
        view.backgroundColor = .orange
    }
    
    func addViews() {
        view.addSubview(label)
        view.addSubview(textfield)
        view.addSubview(button)
    }
    
    func setupLabel() {
        label.text = "Hello!!!"
    }
    
    func setupTextField() {
        textfield.backgroundColor = .gray
    }
    
    func setupButton() {
        button.backgroundColor = .black
        button.setTitle("GO ahead", for: .normal)
        button.tintColor = .white
    }
}

//MARK: - Layout

private extension ViewController {
    
    func layout() {
        // disconect storyboard option 1
        /*
        label.translatesAutoresizingMaskIntoConstraints = false
        textfield.translatesAutoresizingMaskIntoConstraints = false
         */
        
        // option 2
        [label, textfield, button].forEach {
            // disconect storyboard
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            // add corner radius
            $0.layer.cornerRadius = 12
        }
        
        
        // option 1
        /*
         // add constains
         label.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
         label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         */
        
        // option 2
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfield.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 100)
            
        ])
    }
}


