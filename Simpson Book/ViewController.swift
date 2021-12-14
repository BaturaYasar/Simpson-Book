//
//  ViewController.swift
//  Simpson Book
//
//  Created by Mehmet Baturay Yasar on 14/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpsons]()
    var chosenSimpson : Simpsons?
    
  
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Simpsons Objects
        
        let homer = Simpsons(simpsonsName: "Homer Simpson", simpsonsJob: "Nuclear Safety", simpsonsImage: UIImage(named: "homer")!)
        let bart = Simpsons(simpsonsName: "Bart Simpson", simpsonsJob: "Student", simpsonsImage: UIImage(named: "bart")!)
        let charles = Simpsons(simpsonsName: "Mr. Burns", simpsonsJob: "Inspector", simpsonsImage: UIImage(named: "burns")!)
        let lisa = Simpsons(simpsonsName: "Lisa Simpson", simpsonsJob: "Student", simpsonsImage: UIImage(named: "lisa")!)
        let ned = Simpsons(simpsonsName: "Ned Simpson", simpsonsJob: "Teacher", simpsonsImage: UIImage(named: "ned")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(bart)
        mySimpsons.append(charles)
        mySimpsons.append(lisa)
        mySimpsons.append(ned)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
    
    
   


}

