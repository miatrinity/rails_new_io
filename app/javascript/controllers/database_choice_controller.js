import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update() {  
    const output = this.nameTarget.dataset.commandOutput
    const spacedOutput = ' ' + output
    const styledOutput = (output === '' ? '' : spacedOutput)
        
    document.getElementById('database-choice').textContent = styledOutput
  }
}