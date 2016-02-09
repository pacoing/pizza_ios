

import UIKit

protocol communicationController {
  func setSize()
  func setDough()
  func setCheese()
  func setIngredients()
}
class ViewController: UIViewController {
  
  //  var delegateTamano:communicationControlerTamano? = nil
  //  var delegateMasa: communicationControlerMasa? = nil
  var delegate: communicationController? = nil
  
  let pizza = Pizza(tamano: "", masa: "",queso: "",ingredientes: [])
  
  enum Constantes {
    case Tamano
    case Masa
  }
  
  @IBOutlet weak var tamanoLabel: UIButton!
  // Almacenamos el tamaño de la pizza
  var tamanoPvara:String?
  var tipoMasa:String?
  
  // Almacenamos cuales tipos/ingredientes aun no tengo
  var compruebaEleccion = [Constantes.Tamano:false]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.delegate?.setDough()
    self.delegate?.setSize()
    self.delegate?.setCheese()
    self.delegate?.setIngredients()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func btnConfirmacion(sender: AnyObject) {
    // Variable para saber si estan todos los pasos hechos
    print("tamano: \(pizza.tamano) masa: \(pizza.masa) queso: \(pizza.queso) ingredientes: \(pizza.ingredientes)")
    
    // Comprobamos que existan todos los ingredientes
    var estanTodos:Bool = true;
    var estanTodosIngredientes:Bool = false
    if pizza.tamano == "" {
      estanTodos = false;
    }
    if pizza.masa == "" {
      estanTodos = false;
    }
    if pizza.queso == "" {
      estanTodos = false
    }
    if pizza.ingredientes!.isEmpty {
      estanTodos = false
    } else {
      for index in pizza.ingredientes! {
        if (index != "Ninguno") {
          estanTodosIngredientes = true;
        }
      }
    }
    if (!estanTodos || !estanTodosIngredientes) {
      let alert = UIAlertController(title: "Mensaje del chef", message: "No has selccionado todas las opciones para la pizza", preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
    } else {
      print("Correcto")
      self.performSegueWithIdentifier("etapaConfirmacion", sender: nil)
      
    }
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier == "tamanoPizza") {
      print("tamaño")
      let destinationViewController = segue.destinationViewController as! ViewTamanoController
      destinationViewController.pizza = self.pizza
    }
    if (segue.identifier == "tipoMasa") {
      print("masa")
      let destinationViewController = segue.destinationViewController as! ViewTipoMasaController
      destinationViewController.pizza = self.pizza
    }
    if (segue.identifier == "tipoQueso") {
      print("queso")
      let destinationViewController = segue.destinationViewController as! ViewTipoQuesoController
      destinationViewController.pizza = self.pizza
    }
    if (segue.identifier == "tipoIngredientes") {
      print("ingredientes")
      let destinationViewController = segue.destinationViewController as! ViewIngredientesController
      destinationViewController.pizza = self.pizza
    }
    if (segue.identifier == "etapaConfirmacion") {
      print("confirmacion")
      let destinationViewController = segue.destinationViewController as! ViewConfirmationController
      destinationViewController.pizza = self.pizza
    }

  }
  
  
}

