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
    var rulesToCheck : Set<Int> = []
    var finalScore: Int = 0
    var secondsFromTimer: Int = 15
    var rightAnswer: String = ""
    var modalidad : String!
    var username : String!
    
    @IBOutlet weak var labelInstruction: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonMin: UIButton!
    @IBOutlet weak var buttonMayu: UIButton!
    @IBOutlet weak var labelScore: UILabel!
    
    @IBOutlet weak var buttonOpc1: UIButton!
    @IBOutlet weak var buttonOpc2: UIButton!
    @IBOutlet weak var buttonOpc3: UIButton!
    @IBOutlet weak var buttonOpc4: UIButton!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //print(modalidad)
        ruta = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        getAllQuestions()
        getRealQuestions()
        newQuestion()
        
        labelScore.text = "0/\(toUseQuestionList.count)"
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
            labelInstruction.text = "Seleccione si la palabra debe iniciar con mayúscula o minúscula"
            buttonMin.setTitle("minúscula", for: .normal)
            buttonMayu.setTitle("mayúscula", for: .normal)
            
            desactivaBotones()
            
        }
        else if difficulty == 2 {
            labelInstruction.text = "Seleccione las palabras que deben de iniciar con mayúscula"
            
            desactivaBotones()
            textForButton()
            
        }
        
        labelQuestion.text = toUseQuestionList[currQuestion].enunciado
    
    }
    
    func showResults() {
        var alert : UIAlertController
        if score == toUseQuestionList.count {
            alert = UIAlertController(title: "Resultado", message: "Has obtenido \(score)/\(toUseQuestionList.count) aciertos.\n¡Felicidades!", preferredStyle: UIAlertController.Style.alert)
        }
        else {
            var rules : String = ""
            for r in rulesToCheck {
                rules = rules + "\(r),"
            }
            rules.remove(at: rules.index(before: rules.endIndex))
            
            alert = UIAlertController(title: "Resultado", message: "Has obtenido \(score)/\(toUseQuestionList.count) aciertos\nRevisa la o las siguientes reglas: \(rules)"  , preferredStyle: UIAlertController.Style.alert)
        }
        
        alert.addTextField()
        let saveAction = UIAlertAction(title: "Guardar", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            print("GUARDAR")
            let firstTextField = alert.textFields![0] as UITextField
            if let firstText = firstTextField.text{
                if firstText != ""{
                    self.username = firstText
                }else{
                    self.username = "USER"
                }
            }
            self.guardarDatos()
        })
        
        let cancelAction = UIAlertAction(title: "Salir", style: .cancel, handler: nil)
        
        //alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func guardarDatos(){
        calcFinalScore()
        
        let defaults = UserDefaults.standard
        if let unwMod = modalidad{
            print("SE LOGRO WU " + unwMod)
            
            
            do {
                if let storedObjItem = defaults.object(forKey: unwMod){
                    let storedItems = try JSONDecoder().decode([Puntaje].self, from: storedObjItem as! Data)
                    var arr = storedItems
                    arr.sort(by: >)
                    
                    if arr.count < 10{
                        arr.append(Puntaje(jugador: username, puntos: finalScore))
                        arr.sort(by: >)
                        if let encodedArr = try? JSONEncoder().encode(arr){
                            defaults.set(encodedArr, forKey: unwMod)
                        }
                    }else if finalScore > arr[arr.count-1].puntos{
                        //print(arr[arr.count-1])
                        arr.remove(at: arr.count-1)
                        //print(arr[arr.count-1])
                        arr.append(Puntaje(jugador: username, puntos: finalScore))
                        //print(arr[arr.count-1])
                        arr.sort(by: >)
                        if let encodedArr = try? JSONEncoder().encode(arr){
                            defaults.set(encodedArr, forKey: unwMod)
                        }
                    }
                    
                }else{
                    var arr = [Puntaje] ()
                    arr.append(Puntaje(jugador: username, puntos: finalScore))
                    arr.sort(by: >)
                    if let encodedArr = try? JSONEncoder().encode(arr){
                        defaults.set(encodedArr, forKey: unwMod)
                    }
                }
                //print("Retrieved items: \(storedItems)")
            } catch let err {
                print(err)
            }
            
        }
    }
    
    @IBAction func pressedMin(_ sender: UIButton) {
        if toUseQuestionList[currQuestion].respuesta[0] == "min" {
            score += 1
            print("correct")
            labelScore.text = "\(score)/\(toUseQuestionList.count)"
        }
        else {
            rulesToCheck.formUnion(toUseQuestionList[currQuestion].normas)
        }
        
        currQuestion += 1
        if (currQuestion < toUseQuestionList.count) {
            newQuestion()
        }
        else {
            showResults()
        }
        
        
    }
    
    @IBAction func pressedMayu(_ sender: Any) {
        if toUseQuestionList[currQuestion].respuesta[0] == "mayu" {
            score += 1
            print("correct")
            labelScore.text = "\(score)/\(toUseQuestionList.count)"
        }
        else {
            rulesToCheck.formUnion(toUseQuestionList[currQuestion].normas)
        }
        currQuestion += 1
        if (currQuestion < toUseQuestionList.count) {
            newQuestion()
        }
        else {
            showResults()
        }
    }
    
    //Función que cambia la configuración de los botones en pantalla dependiendo de la dificultad establecida
    func desactivaBotones(){
        if difficulty == 1 {
            buttonOpc1.isEnabled = false
            buttonOpc2.isEnabled = false
            buttonOpc3.isEnabled = false
            buttonOpc4.isEnabled = false
            
            buttonMin.isEnabled = true
            buttonMayu.isEnabled = true
            
            buttonOpc1.backgroundColor = .none
            buttonOpc2.backgroundColor = .none
            buttonOpc3.backgroundColor = .none
            buttonOpc4.backgroundColor = .none
            
            buttonOpc1.setTitleColor(UIColor.white, for: UIControl.State.disabled)
            buttonOpc2.setTitleColor(UIColor.white, for: UIControl.State.disabled)
            buttonOpc3.setTitleColor(UIColor.white, for: UIControl.State.disabled)
            buttonOpc4.setTitleColor(UIColor.white, for: UIControl.State.disabled)
            
            
        }else if difficulty == 2 {
            buttonMin.isEnabled = false
            buttonMayu.isEnabled = false
            
            buttonOpc1.isEnabled = true
            buttonOpc2.isEnabled = true
            buttonOpc3.isEnabled = true
            buttonOpc4.isEnabled = true
            
            buttonMin.backgroundColor = .none
            buttonMayu.backgroundColor = .none
            
            buttonMin.setTitleColor(UIColor.white, for: UIControl.State.disabled)
            buttonMayu.setTitleColor(UIColor.white, for: UIControl.State.disabled)
        }
    }
    
    //Función que asigna texto a los botones
    func textForButton(){
        
        var optionsWords = [String]()
        
        for i in toUseQuestionList[currQuestion].opciones{
            var wordProv: String = ""
            for w in i {
                wordProv += w + ", "
            }
            wordProv = String(wordProv.dropLast(2))
            optionsWords.append(wordProv)
        }
        
        //Se obtiene la respuesta correcta
        rightAnswer = ""
        for r in toUseQuestionList[currQuestion].respuesta{
            rightAnswer += r + ", "
        }
        rightAnswer = String(rightAnswer.dropLast(2))
        print(rightAnswer)
        
        //Se revuelve el arreglo que contiene las opciones de respuesta
        optionsWords.shuffle()
        
        //Se asignan las opciones a los botones
        buttonOpc1.setTitle(optionsWords[0], for: .normal)
        buttonOpc2.setTitle(optionsWords[1], for: .normal)
        buttonOpc3.setTitle(optionsWords[2], for: .normal)
        buttonOpc4.setTitle(optionsWords[3], for: .normal)
        //print(optionsWords)
    
    }
    
    //Función para validar las respuestas con 4 opciones
    @IBAction func clickOptionButton(_ sender: UIButton) {
        if(sender.titleLabel?.text == rightAnswer) {
            score += 1
            print("correct")
            labelScore.text = "\(score)/\(toUseQuestionList.count)"
        }else{
            print("incorrect")
            rulesToCheck.formUnion(toUseQuestionList[currQuestion].normas)
        }
        
        currQuestion += 1
        if (currQuestion < toUseQuestionList.count) {
            newQuestion()
        }
        else {
            showResults()
        }
        
    }
    
    
    //Función para calcular el Score final
    func calcFinalScore() {
        if gameMode == 1 {
            finalScore = (score * 100) - (secondsFromTimer * 2)
        } else if gameMode == 2 {
            finalScore = score * 100
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
