

import UIKit

class Pizza {
  
  var tamano:String?
  var masa:String?
  var queso:String?
  var ingredientes:[String]?
  
  init(tamano: String, masa: String,queso: String,ingredientes:[String]) {
    self.tamano = tamano
    self.masa = masa
    self.queso = queso
    self.ingredientes = ingredientes
  }
}
