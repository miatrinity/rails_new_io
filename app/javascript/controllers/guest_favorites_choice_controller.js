import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update() {        
    document.getElementById('rails-flags').textContent = this.nameTarget.dataset.commandOutput
  }
}