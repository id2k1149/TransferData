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
    private let textField = UITextField()
    private let button = UIButton()
    private var text = ""

    //MARK: - Override UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Actions
    
    // option 3 - using segue for second button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ViewControllerTwoID2" else { return }
        guard let destination = segue.destination as? ViewControllerTwo else { return }
        destination.text = "TEST"
    }
    
    
    @objc
    private func goToViewControllerTwo() {
        print("goToViewControllerTwo")
        
        // option 1 - using code
        // where we go
        let viewController = ViewControllerTwo()
        
        // what we send to viewController
        viewController.text = text
        
        // call completion from ViewControllerTwo
        viewController.completion = { text in
            self.label.text = text
        }
        
        // open ViewControllerTwo()
        present(viewController, animated: true)
         
        
        // option 2 - using storyBoard
        /*
        // where we go
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        // dont forget to add ViewControllerTwoID to storyBoard
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "ViewControllerTwoID") as? ViewControllerTwo else { return }
        
        // what we send to viewController
        vc.text = text
        
        // open ViewControllerTwo()
        present(vc, animated: true)
         */
        
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
        view.addSubview(textField)
        view.addSubview(button)
    }
    
    func addActions() {
        button.addTarget(self, action: #selector(goToViewControllerTwo), for: .touchUpInside )
    }
    
    func setupLabel() {
        label.backgroundColor = .green
        label.text = "Hello!!! Hello!!!"
    }
    
    func setupTextField() {
        textField.backgroundColor = .gray
        textField.delegate = self
    }
    
    func setupButton() {
        button.backgroundColor = .black
        button.setTitle("GO ahead", for: .normal)
        button.tintColor = .white
    }
    
    // add custom Label for each label (option 2)
    /*
    func customLabel(text: String, color: UIColor) -> UILabel {
        let label = UILabel()
        
        label.layer.cornerRadius = 10
        label.tintColor = .red
        
        label.text = text
        label.backgroundColor = color
        
        return label
    }
     */
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
        [label, textField, button].forEach {
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
            label.widthAnchor.constraint(equalToConstant: 270),
            label.heightAnchor.constraint(equalToConstant: 50),
            
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 400),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 100),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}

// MARK: - UITextFieldDelegate


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // must add textfield.delegate = self to func setupTextField()
        print(textField.text ?? "N/A")
        
        text = textField.text ?? "N/A"
        
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


