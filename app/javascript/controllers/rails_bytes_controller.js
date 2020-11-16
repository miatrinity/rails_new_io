import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update() {  
    console.log('Hurkaaaa')
    const output = this.nameTarget.dataset.commandOutput
    const spacedOutput = ' ' + '--template ' + output
    const styledOutput = (output === '' ? '' : spacedOutput)
        
    document.getElementById('rails-bytes').textContent = styledOutput
  }
}