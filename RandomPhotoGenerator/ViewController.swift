//
//  ViewController.swift
//  RandomPhotoGenerator
//
//  Created by Henrieke Baunack on 7/4/22.
//

import UIKit
//hit command R to run

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Click here!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGreen
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) //apple calls a button tap a touchUpInside
            // using self as the button and function are here in the same class
        getRandomPhoto()
    }
    
//    @objc needed to attach the function to a button
    @objc func didTapButton() {
        getRandomPhoto()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect (x: 35, y: 100, width: 300, height: 55)
        button.layer.cornerRadius = 30
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)! // the ! shows swift that the url is indeed valid
        guard let data = try? Data(contentsOf: url) else{return}
        imageView.image = UIImage(data: data)
    }
    
    


}

