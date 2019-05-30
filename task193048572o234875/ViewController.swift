//
//  ViewController.swift
//  my_task
//
//  Created by Khusnutdinov Nikita on 08/05/2019.
//  Copyright © 2019 x1Dman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var ColorController: UISegmentedControl!
    @IBOutlet weak var ResetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image.backgroundColor = .blue
        
        setColorController()
        
        Image.isUserInteractionEnabled = true
    Image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleAlpha)))
        
        ResetButton.addTarget(self, action: #selector(resetImage), for: .allTouchEvents)
        
        ColorController.addTarget(self, action: #selector(changeColor), for: .valueChanged)

    }
    
    @objc private func toggleAlpha() {
        Image.alpha = Image.alpha == 1.0 ? 0.1 : 1.0;
    }
    
    @objc private func resetImage() {
        
            Image.backgroundColor = .blue
        ColorController.selectedSegmentIndex = 0
    }

    private func setColorController() {
        
        ColorController.removeAllSegments()
        ColorController.insertSegment(withTitle: "Blue", at: 0, animated: true)
        
        ColorController.insertSegment(withTitle: "Red", at: 1, animated: true)
        
        ColorController.insertSegment(withTitle: "Blue", at: 2, animated: true)
        
        ColorController.selectedSegmentIndex = 0
        
    }
    
    @objc private func changeColor() {
        switch ColorController.selectedSegmentIndex {
        case 0:
            Image.backgroundColor = .blue
        case 1:
            Image.backgroundColor = .red
        case 2:
            Image.backgroundColor = .green
        default:
            break
        }
    }

}

