import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update() {    
    document.getElementById('database-choice').textContent = this.nameTarget.dataset.commandOutput
  }
}