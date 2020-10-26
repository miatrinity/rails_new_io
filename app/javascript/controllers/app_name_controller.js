import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "output" ]
  
  update() {      
    this.outputTarget.textContent = this.inputTarget.value
  }
}