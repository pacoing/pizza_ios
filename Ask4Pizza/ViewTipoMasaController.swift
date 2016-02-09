

import UIKit

class ViewTipoMasaController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,communicationController  {
  
  @IBOutlet weak var tipoMasaLabel: UILabel!
  @IBOutlet weak var tipoMasaSelector: UIPickerView!
  
  let pickerData = ["Delgada","Crujiente","Gruesa"]
  
  var pizza = Pizza?()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    tipoMasaSelector.dataSource = self
    tipoMasaSelector.delegate = self
    tipoMasaLabel.text = "Delgada"
    
  }
  
  override func viewDidAppear(animated: Bool) {
    let controllerView = ViewController()
    //controllerView.delegateMasa = self
    controllerView.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
    tipoMasaLabel.text = pickerData[row]
  }
  func pickerView(pickerView:UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    let attributedString = NSAttributedString(string: pickerData[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
    return attributedString
    
  }

  @IBAction func btnAceptar(sender: AnyObject) {
    pizza?.masa = tipoMasaLabel.text
    //print(pizza!.masa)
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func setDough() {
    pizza?.masa = tipoMasaLabel.text
    //print(pizza!.masa)
  }
  func setSize() {
    
  }
  func setCheese() {
    
  }
  func setIngredients() {
    
  }
  
  

  
}
