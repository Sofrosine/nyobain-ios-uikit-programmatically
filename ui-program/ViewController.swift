//
//  ViewController.swift
//  ui-program
//
//  Created by Soultan Muhammad Albar on 28/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    var imageBoardName: String
    var titleBoard: String
    var subtitleBoard: String
    
    
    init(imageBoardName: String, titleBoard: String, subtitleBoard: String) {
        self.imageBoardName = imageBoardName
        self.titleBoard = titleBoard
        self.subtitleBoard = subtitleBoard
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

    lazy var onboardingImage: UIImageView = {
        let imageName = imageBoardName
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    lazy var onboardingTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = titleBoard
        title.textAlignment = .center
        title.font = UIFont(name: "CircularStd-Bold", size: 24)
        title.textColor = .black
        
        return title
    }()
    
    lazy var onboardingSubtitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = subtitleBoard
        title.textAlignment = .center
        title.font = UIFont(name: "CircularStd-Book", size: 16)
        title.textColor = .gray
        title.numberOfLines = 0
        
        return title
    }()
    
    lazy var textStack: UIStackView = {
        let textStackView = UIStackView(arrangedSubviews: [onboardingTitle, onboardingSubtitle])
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.alignment = .center
        textStackView.axis = .vertical
        textStackView.spacing = 12
        textStackView.distribution = .fill
        
        return textStackView
    }()
    
    lazy var topStack: UIStackView = {
        let topStackView  = UIStackView(arrangedSubviews: [onboardingImage, textStack])
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.alignment = .center
        topStackView.axis = .vertical
        topStackView.spacing = 40
        topStackView.distribution = .fill
        
        return topStackView
    }()
    
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        view.addSubview(topStack)
        
        topStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        topStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        topStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
}

