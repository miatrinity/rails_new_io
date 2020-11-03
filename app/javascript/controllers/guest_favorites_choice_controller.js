import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update() {        
    const originalRailsFlags = document.getElementById('rails-flags').textContent     
    let railsFlags = originalRailsFlags.split(' ')    
    const railsFlag = this.nameTarget.dataset.commandOutput    
    
    if(railsFlags.includes(railsFlag)) {
      const index = railsFlags.indexOf(railsFlag);
      
      railsFlags.splice(index, 1);
    } else {
      railsFlags.push(railsFlag)
    }
    
    const output = railsFlags.sort().join(' ').trim()
    const spacedOutput = ' ' + output
    const styledOutput = (output === '' ? '' : spacedOutput)
       
    document.getElementById('rails-flags').textContent = styledOutput;
  }
}