//
//  ViewController.swift
//  RandomFood
//
//  Created by Oskar Lövstrand on 2024-03-19.
//

import UIKit

class MainViewController: UIViewController, AddDishViewControllerDelegate {
    var dishes = [Dish]()
    
    @IBAction func AddDishButton(_ sender: UIButton) {
    }
    
    @IBAction func RandomDishButton(_ sender: UIButton) {
        if !dishes.isEmpty {
            let randomDish = dishes.randomElement()!
            displayDishInfo(randomDish)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func didAddDish(dish: Dish) {
        dishes.append(dish)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDishSegue",
           let addDishVC = segue.destination as? AddDishViewController {
            addDishVC.delegate = self
        }
    }
    
    func displayDishInfo(_ dish: Dish) {
        let alertController = UIAlertController(title: dish.name, message: "Type: \(dish.type)\nDescription: \(dish.description)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
            present(alertController, animated: true)
    }

}
