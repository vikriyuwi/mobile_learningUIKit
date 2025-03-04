//
//  ViewController.swift
//  learningUIKit
//
//  Created by Vikri Yuwi on 03/03/25.
//

import UIKit

class FirstScreen: UIViewController {
    
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First Screen"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        setupButton()
        // Do any additional setup after loading the view.
    }

    func setupButton() {
        view.addSubview(nextButton)
        nextButton.configuration = .borderedProminent()
        nextButton.configuration?.cornerStyle = .large
        nextButton.tintColor = .systemGreen
        
        let bodyFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
        let boldBodyFont = UIFont(descriptor: bodyFontDescriptor.withSymbolicTraits(.traitBold) ?? bodyFontDescriptor, size: 0)
        nextButton.configuration?.attributedTitle = AttributedString("next", attributes: AttributeContainer([
            .font: boldBodyFont
        ]))
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // make it center
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // make it on the bottom of screen
            nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: view.width-40),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
    }
    
    @objc func handleNextButton() {
        let nextScreen = SecondScreen()
        nextScreen.title = "Second Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}

#Preview {
    let vcFirstScreen = FirstScreen()
    return vcFirstScreen
}
