//
//  SecondScreen.swift
//  learningUIKit
//
//  Created by Vikri Yuwi on 04/03/25.
//

import UIKit

class SecondScreen: UIViewController {
    
    var backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        title = "Second Screen"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
    }
    
    func setupBackButton() {
        view.addSubview(backButton)
        backButton.configuration = .borderedProminent()
        backButton.configuration?.cornerStyle = .large
        backButton.tintColor = .systemGray4
        
        let bodyFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
        let boldBodyFont = UIFont(descriptor: bodyFontDescriptor.withSymbolicTraits(.traitBold) ?? bodyFontDescriptor, size: 0)
        
        let arrowImage = UIImage(systemName: "chevron.left") // SF Symbol for back arrow
        backButton.configuration?.image = arrowImage
        backButton.configuration?.imagePadding = 8  // Adds spacing between image and text
        backButton.configuration?.imagePlacement = .leading
        backButton.configuration?.baseForegroundColor = .label
        
        backButton.configuration?.attributedTitle = AttributedString("back", attributes: AttributeContainer([
            .font: boldBodyFont
        ]))
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: view.width-40),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    }
    
    @objc func handleBackButton() {
        if presentingViewController != nil {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

}

#Preview {
    let vcSecondScreen = SecondScreen()
    return vcSecondScreen
}
