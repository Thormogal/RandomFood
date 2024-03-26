//
//  AddDishViewController.swift
//  RandomFood
//
//  Created by Oskar Lövstrand on 2024-03-19.
//

import UIKit

protocol AddDishViewControllerDelegate: AnyObject {
    func didAddDish(dish: Dish)
}

class AddDishViewController : UIViewController {
    
    @IBOutlet weak var dishNameTextView: UITextView!
    @IBOutlet weak var dishTypeTextView: UITextView!
    @IBOutlet weak var dishDescriptionTextView: UITextView!
    
    weak var delegate: AddDishViewControllerDelegate?
    
    
    @IBAction func saveDishButtonTapped(_ sender: UIButton) {
        let newDish = Dish(name: dishNameTextView.text ?? "",
                           type: dishTypeTextView.text ?? "",
                           description: dishDescriptionTextView.text ?? "")
        delegate?.didAddDish(dish: newDish)
        
        dismiss(animated: true, completion: nil)
    
    }
    
    
}
