//
//  ViewController.swift
//  ElementQuizCode
//
//  Created by Yamashtia Keisuke on 2019-08-15.
//  Copyright © 2019 Yamashtia Keisuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UIImage
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Sodium")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    //UILable
    let answerLable: UILabel = {
        let lb = UILabel()
        lb.text = "?"
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    //UIButton - showAnswer
    let showAnswerBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Show Answer", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //UIButton = nextElement
    let nextElementBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next Element", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var elements:[Element] = [
        Element(symbol: "C", name: "Carbon", imageName: "Carbon", atomicWeight: 6),
        Element(symbol: "Cl", name: "Chlorine", imageName: "Chlorine", atomicWeight: 17),
        Element(symbol: "Au", name: "Gold", imageName: "Gold", atomicWeight: 79),
        Element(symbol: "Na", name: "Sodium", imageName: "Sodium", atomicWeight: 11),
    ]
    
    var currentElementIndex = 0
    
    fileprivate func updateUI() {
        // Do any additional setup after loading the view.
        let element = elements[currentElementIndex]
        answerLable.text = "?"
        imageView.image = UIImage(named: element.imageName)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // w: 140 h:140 imageView
        updateUI()
        

        imageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        // put all four views in stackview
        let stackView = UIStackView(arrangedSubviews: [
            imageView, answerLable, showAnswerBtn, nextElementBtn
            ])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        showAnswerBtn.addTarget(self, action: #selector(showAnswerTapped), for: .touchUpInside)
        nextElementBtn.addTarget(self, action: #selector(gotoNextElement), for: .touchUpInside)

    }
    
    @objc func showAnswerTapped() {
        answerLable.text = elements[currentElementIndex].name
    }
    
    @objc func gotoNextElement() {
        currentElementIndex += 1
        if currentElementIndex >= elements.count {
            currentElementIndex = 0
        }
        updateUI()
    }

}

