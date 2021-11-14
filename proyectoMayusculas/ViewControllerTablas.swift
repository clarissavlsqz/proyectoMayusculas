//
//  ViewControllerTablas.swift
//  proyectoMayusculas
//
//  Created by user198119 on 11/13/21.
//

import UIKit

class ViewControllerTablas: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segControl: UISegmentedControl!
    var arreglo = [Puntaje] ()
    var key = "ZF"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        switch segControl.selectedSegmentIndex{
        case 0:
            key = "ZF"
        case 1:
            key = "ZD"
        case 2:
            key = "CF"
        case 3:
            key = "CD"
        default:
            key = "ZF"
        }
        
        actualizaArreglo()
    }
    
    func actualizaArreglo(){
        let defaults = UserDefaults.standard
        
        /*if let arr = defaults.object(forKey: key) as? [Int]{
            arreglo = arr
            print(arr[arr.count-1])
            arreglo.sort(by: >)
        }else{
            arreglo = []
        }*/
        
        do {
            
            
            if let storedObjItem = defaults.object(forKey: key){
                let storedItems = try JSONDecoder().decode([Puntaje].self, from: storedObjItem as! Data)
                arreglo = storedItems
                arreglo.sort(by: >)
            }else{
                arreglo = []
            }
            //print("Retrieved items: \(storedItems)")
        } catch let err {
            print(err)
        }
        
        tableView.reloadData()
        
        
    }

    
    
    @IBAction func changeTable(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            key = "ZF"
        case 1:
            key = "ZD"
        case 2:
            key = "CF"
        case 3:
            key = "CD"
        default:
            key = "ZF"
        }
        actualizaArreglo()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arreglo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.nombre?.text = arreglo[indexPath.row].jugador
        cell.puntaje?.text = String(arreglo[indexPath.row].puntos)
        cell.tiempo?.text = arreglo[indexPath.row].tiempo.description
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
