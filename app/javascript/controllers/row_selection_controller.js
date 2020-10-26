import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "checked" ]
    
  update() {      
    this.checkedTarget.checked = true
  }
}