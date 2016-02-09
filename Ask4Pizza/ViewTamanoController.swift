

import UIKit


class ViewTamanoController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, communicationController {
  
  
  @IBOutlet weak var tamanoSelector: UIPickerView!
  @IBOutlet weak var labelTamano: UILabel!
  
  let pickerData = ["Chica","Mediana","Grande"]
  
  var pizza = Pizza?()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tamanoSelector.dataSource = self
    tamanoSelector.delegate = self
    labelTamano.text = "Chica"
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    let viewController = ViewController()
    //viewController.delegateTamano = self
    viewController.delegate = self
  }
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData.count
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    labelTamano.text = pickerData[row]
  }
  
  //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  //        if (segue.identifier == "fromTamanoToController") {
  //            print("segue tamaño")
  //            let viewController = segue.destinationViewController as! ViewController
  ////            viewController.tamanoPizza = labelTamano.text;
  //            viewController.pizza.tamano = labelTamano.text
  //        }
  //    }
  
  func setSize() {
    pizza?.masa = labelTamano.text
  }
  func setDough() {
    
  }
  func setCheese() {
  }
  func setIngredients() {
    
  }
  @IBAction func btnAceptar(sender: AnyObject) {
    //        print("aceptar tamaño")
    pizza?.tamano = labelTamano.text
    //print(pizza!.tamano)
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
