
import UIKit

class ViewTipoQuesoController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,communicationController {
  
  var pizza = Pizza?()
  let pickerData = ["Morazela","Cheddar","Parmesano","Sin Queso"]
  
  
  @IBOutlet weak var tipoQuesoSelector: UIPickerView!
  @IBOutlet weak var tipoQuesoLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tipoQuesoSelector.delegate = self
    tipoQuesoSelector.dataSource = self
    tipoQuesoLabel.text = "Mozarela"
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    let controllerView = ViewController()
    //controllerView.delegateMasa = self
    controllerView.delegate = self
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
    tipoQuesoLabel.text = pickerData[row]
  }
  
  func pickerView(pickerView:UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    let attributedString = NSAttributedString(string: pickerData[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
    return attributedString
    
  }
  func setDough() {
  }
  func setSize() {
  }
  func setCheese(){
    pizza?.queso = tipoQuesoLabel.text
    //print(pizza!.queso)
  }
  func setIngredients() {
    
  }
  
  @IBAction func btnAceptar(sender: AnyObject) {
    pizza?.queso = tipoQuesoLabel.text
    //print(pizza!.queso)
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  
}
