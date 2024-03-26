//
//  ViewController.swift
//  RandomFood
//
//  Created by Oskar Lövstrand on 2024-03-19.
//

import UIKit

class MainViewController: UIViewController, AddDishViewControllerDelegate, UITableViewDataSource {
    var dishes = [Dish]()
    
    @IBAction func AddDishButton(_ sender: UIButton) {
    }
    
    @IBAction func RandomDishButton(_ sender: UIButton) {
        if !dishes.isEmpty {
            let randomDish = dishes.randomElement()!
            displayDishInfo(randomDish)
        }
    }
    
    @IBOutlet weak var ShowRecipesTableView: UITableView!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        view.addGestureRecognizer(tapGesture)
        
        let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        ShowRecipesTableView.register(nib, forCellReuseIdentifier: "RecipeCell")
    }

    func didAddDish(dish: Dish) {
        dishes.append(dish)
        ShowRecipesTableView.reloadData()
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        var dish = dishes[indexPath.row]
        return cell
    }

}
