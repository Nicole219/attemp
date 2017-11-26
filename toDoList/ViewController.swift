//
//  ViewController.swift
//  toDoList
//
//  Created by Goodworkapps on 05.11.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var lable: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
/*   @IBAction func onSignOutTapped(_ sender: Any) {
       do {
           try Auth.auth().signOut()
            performSegue(withIdentifier: "signoutSegue", sender: nil)
        } catch {
            print(error)
        }
    }*/
    
    
    
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        guard let username = Auth.auth().currentUser?.displayName else {return}
        lable.text = "Привет \(username)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getdata()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name!
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getdata()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks=try context.fetch(Task.fetchRequest())
        }
        catch{
            print("fetch fail");
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                tasks=try context.fetch(Task.fetchRequest())
            }
            catch{
                print("fetch fail");
            }
            
        }
        tableView.reloadData()
        }
    
}

