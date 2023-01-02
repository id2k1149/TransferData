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
//    private let labelTwo = customLabel(text: "GoodBye", color: .blue)
    private let textfield = UITextField()
    private let button = UIButton()

    //MARK: - Override UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Actions
    
    @objc
    private func goToViewControllerTwo() {
        print("goToViewControllerTwo")
    }
}

//MARK: - Setup View

private extension ViewController {
    
    func setupView() {
        addViews()
        addActions()
        
        setupSelfView()
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
    
    func addActions() {
        button.addTarget(self, action: #selector(goToViewControllerTwo), for: .touchUpInside )
    }
    
    func setupLabel() {
        label.text = "Hello!!!"
    }
    
    func setupTextField() {
        textfield.backgroundColor = .gray
        textfield.delegate = self
    }
    
    func setupButton() {
        button.backgroundColor = .black
        button.setTitle("GO ahead", for: .normal)
        button.tintColor = .white
    }
    
    // add custom Label for each label (option 2)
    func customLabel(text: String, color: UIColor) -> UILabel {
        let label = UILabel()
        
        label.layer.cornerRadius = 10
        label.tintColor = .red
        
        label.text = text
        label.backgroundColor = color
        
        return label
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

// MARK: - UITextFieldDelegate


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // must add textfield.delegate = self to func setupTextField()
        print(textfield.text ?? "N/A")
        
        return true
    }
    
    
}

// to add custom Label (option 1)
/*
final class MyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 */


