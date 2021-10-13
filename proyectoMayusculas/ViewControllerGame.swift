//
//  ViewControllerGame.swift
//  proyectoMayusculas
//
//  Created by Clarissa Velásquez Magaña on 12/10/21.
//

import UIKit

class ViewControllerGame: UIViewController {
    
    var gameMode : Int!
    var difficulty : Int!
    var ruta : String!
    var allQuestionList = [Pregunta]()
    var toUseQuestionList = [Pregunta]()
    var currQuestion = 0
    var score = 0
    
    @IBOutlet weak var labelInstruction: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonMin: UIButton!
    @IBOutlet weak var buttonMayu: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ruta = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        getAllQuestions()
        getRealQuestions()
    }
    
    func getAllQuestions() {
        do {
            let data = try Data.init(contentsOf: URL(fileURLWithPath: ruta))
           allQuestionList = try PropertyListDecoder().decode([Pregunta].self, from: data)
        }
            catch {
                print("ERROR al cargar el archivo")
            }
    }
    
    func getRealQuestions() {
        for q in allQuestionList {
            if q.dificultad == difficulty {
                toUseQuestionList.append(q)
            }
        }
    }
    
    func newQuestion() {
        if difficulty == 1 {
            labelInstruction.text = "Seleccione si la palabra debe llevar mayúscula o minúscula"
        }
        else if difficulty == 2 {
            labelInstruction.text = "Seleccione las palabras que deben de llevar mayúscula"
        }
        
        
        
        
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
