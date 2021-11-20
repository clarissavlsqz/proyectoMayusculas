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
    var numQ = 1
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
    
    @IBOutlet weak var imagePurpleBg: UIImageView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor =  UIColor.white
        // Do any additional setup after loading the view.
        imagePurpleBg.clipsToBounds = false
        imagePurpleBg.layer.shadowColor = UIColor.black.cgColor
        imagePurpleBg.layer.shadowOpacity = 1
        imagePurpleBg.layer.shadowOffset = CGSize.zero
        imagePurpleBg.layer.shadowRadius = 10
        imagePurpleBg.layer.shadowPath = UIBezierPath(roundedRect: imagePurpleBg.bounds, cornerRadius: 10).cgPath
        
        viewContainer.layer.cornerRadius = 10
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewContainer.layer.shadowOpacity = 0.7
        viewContainer.layer.shadowRadius = 4.0
        //viewContainer.layer.shadowPath = UIBezierPath(rect: viewContainer.bounds).cgPath
        
        progressBar.progress = 0.0
        

        //print(modalidad)
        ruta = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        getAllQuestions()
        getRealQuestions()
        newQuestion()
        
        labelScore.text = "0/\(toUseQuestionList.count)"
    }
    
    @objc func holdDown(sender : UIButton) {
        sender.layer.borderColor = CGColor(red: 0.46, green: 0.09, blue: 0.59, alpha: 1.00)
    }
    
    @objc func holdRelease(sender : UIButton) {
        sender.layer.borderColor = CGColor(red: 0.87, green: 0.84, blue: 0.94, alpha: 1.00)
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
        toUseQuestionList.shuffle()
    }
    
    func newQuestion() {
        if toUseQuestionList[currQuestion].tipo == 1 {
            labelInstruction.text = "Seleccione si la palabra debe iniciar con mayúscula o minúscula"
            buttonMin.setTitle("minúscula", for: .normal)
            buttonMayu.setTitle("mayúscula", for: .normal)
            
            desactivaBotones()
            
        }
        else if toUseQuestionList[currQuestion].tipo == 2 {
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
            progressBar.progressTintColor = UIColor.green
            print("correct")
            labelScore.text = "\(score)/\(toUseQuestionList.count)"
        }
        else {
            rulesToCheck.formUnion(toUseQuestionList[currQuestion].normas)
            progressBar.progressTintColor = UIColor.red
        }
        
        currQuestion += 1
        progressBar.progress = Float(currQuestion) / Float(toUseQuestionList.count)
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
            progressBar.progressTintColor = UIColor.green
            labelScore.text = "\(score)/\(toUseQuestionList.count)"
        }
        else {
            rulesToCheck.formUnion(toUseQuestionList[currQuestion].normas)
            progressBar.progressTintColor = UIColor.red
        }
        currQuestion += 1
        progressBar.progress = Float(currQuestion) / Float(toUseQuestionList.count)
        if (currQuestion < toUseQuestionList.count) {
            newQuestion()
        }
        else {
            showResults()
        }
    }
    
    //Función que cambia la configuración de los botones en pantalla dependiendo del tipo establecido
    func desactivaBotones(){
        if toUseQuestionList[currQuestion].tipo == 1 {
            buttonMin.layer.cornerRadius = 10
            buttonMayu.layer.cornerRadius = 10
            buttonMin.layer.borderColor = CGColor(red: 0.87, green: 0.84, blue: 0.94, alpha: 1.00)
            buttonMayu.layer.borderColor = CGColor(red: 0.87, green: 0.84, blue: 0.94, alpha: 1.00)
            buttonMin.layer.borderWidth = 2.5
            buttonMayu.layer.borderWidth = 2.5
            buttonMin.addTarget(self, action: #selector(holdDown), for: .touchDown)
            buttonMin.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
            buttonMayu.addTarget(self, action: #selector(holdDown), for: .touchDown)
            buttonMayu.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
            
            
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
            
            buttonOpc1.setTitleColor(UIColor.clear, for: UIControl.State.disabled)
            buttonOpc2.setTitleColor(UIColor.clear, for: UIControl.State.disabled)
            buttonOpc3.setTitleColor(UIColor.clear, for: UIControl.State.disabled)
            buttonOpc4.setTitleColor(UIColor.clear, for: UIControl.State.disabled)
            
            buttonOpc1.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
            buttonOpc2.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
            buttonOpc3.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
            buttonOpc4.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
            
            buttonOpc1.layer.borderWidth = 0
            buttonOpc2.layer.borderWidth = 0
            buttonOpc3.layer.borderWidth = 0
            buttonOpc4.layer.borderWidth = 0

            
        }
        else if toUseQuestionList[currQuestion].tipo == 2 {
            buttonMin.isEnabled = false
            buttonMayu.isEnabled = false
            
            buttonOpc1.isEnabled = true
            buttonOpc2.isEnabled = true
            buttonOpc3.isEnabled = true
            buttonOpc4.isEnabled = true
            
            buttonMin.backgroundColor = .none
            buttonMayu.backgroundColor = .none
            
            buttonMin.setTitleColor(UIColor.clear, for: UIControl.State.disabled)
            buttonMayu.setTitleColor(UIColor.clear, for: UIControl.State.disabled)
            
            buttonMin.layer.borderColor = UIColor.clear.cgColor
            buttonMayu.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
            buttonMin.layer.borderWidth = 0
            buttonMayu.layer.borderWidth = 0
            //buttonMin.frame = CGRect(x: 390, y: 423, width: 270, height: 53)
            
            buttonOpc1.layer.cornerRadius = 10
            buttonOpc1.layer.borderColor = CGColor(red: 0.87, green: 0.84, blue: 0.94, alpha: 1.00)
            buttonOpc1.layer.borderWidth = 2.5
            buttonOpc1.addTarget(self, action: #selector(holdDown), for: .touchDown)
            buttonOpc1.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
            
            buttonOpc2.layer.cornerRadius = 10
            buttonOpc2.layer.borderColor = CGColor(red: 0.87, green: 0.84, blue: 0.94, alpha: 1.00)
            buttonOpc2.layer.borderWidth = 2.5
            buttonOpc2.addTarget(self, action: #selector(holdDown), for: .touchDown)
            buttonOpc2.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
            
            buttonOpc3.layer.cornerRadius = 10
            buttonOpc3.layer.borderColor = CGColor(red: 0.87, green: 0.84, blue: 0.94, alpha: 1.00)
            buttonOpc3.layer.borderWidth = 2.5
            buttonOpc3.addTarget(self, action: #selector(holdDown), for: .touchDown)
            buttonOpc3.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
            
            buttonOpc4.layer.cornerRadius = 10
            buttonOpc4.layer.borderColor = CGColor(red: 0.87, green: 0.84, blue: 0.94, alpha: 1.00)
            buttonOpc4.layer.borderWidth = 2.5
            buttonOpc4.addTarget(self, action: #selector(holdDown), for: .touchDown)
            buttonOpc4.addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
            
            
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
            progressBar.progressTintColor = UIColor.green
            labelScore.text = "\(score)/\(toUseQuestionList.count)"
        }else{
            print("incorrect")
            rulesToCheck.formUnion(toUseQuestionList[currQuestion].normas)
            progressBar.progressTintColor = UIColor.red
        }
        
        currQuestion += 1
        progressBar.progress = Float(currQuestion) / Float(toUseQuestionList.count)
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
