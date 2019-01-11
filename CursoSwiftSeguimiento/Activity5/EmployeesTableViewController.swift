//
//  EmployeesTableViewController.swift
//  CursoSwiftSeguimiento
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class EmployeesTableViewController: UITableViewController {

    var employees = [Employee]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadEmployees()
        // Do any additional setup after loading the view.
    }
    
    func loadEmployees(){
        employees.removeAll()
        
        var emp = Employee()
        emp.name = "Diana"
        emp.clientName = "Ramiro"
        emp.clientDebt = 1000.00
        emp.postalCode = "14000"
        emp.isBoss = false
        emp.address = "Calle X #503"
        emp.routeLat = 19.4336523
        emp.routeLon = -99.1354316
        
        employees.append(emp)
        
        emp.name = "Paulo"
        emp.clientName = "Laura"
        emp.clientDebt = 1500.00
        emp.postalCode = "29950"
        emp.isBoss = true
        emp.address = "Calle Z #404"
        emp.routeLat = 19.4336523
        emp.routeLon = -99.1554316
        employees.append(emp)
        
        
        emp.name = "Emmanuel"
        emp.clientName = "Abril Amayrani"
        emp.clientDebt = 1500.00
        emp.postalCode = "14010"
        emp.isBoss = false
        emp.address = "Calle M #104"
        emp.routeLat = 19.4336523
        emp.routeLon = -99.1554316
        employees.append(emp)
        self.tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "basicCell") as! UITableViewCell
        guard (self.employees.count > indexPath.row) else {
            return cell
        }
        
        let emp = self.employees[indexPath.row]
        cell.textLabel?.text = "\(emp.name)"
        
        if emp.isBoss {
            cell.textLabel?.textColor = UIColor.blue
            //cell.backgroundColor?.cgColor = UIColor.blue.cgColor
        } else {
            cell.textLabel?.textColor = UIColor.black
            //cell.backgroundColor?.cgColor = UIColor.white.cgColor
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard (self.employees.count > indexPath.row) else {
            return
        }
        
        let emp = self.employees[indexPath.row]
        self.performSegue(withIdentifier: "showRouteSegue", sender: emp)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showRouteSegue"){
            guard let w = segue.destination as? MapRouteViewController, let emp = sender as? Employee else { return }
            w.employee = emp
        }
    }
}
