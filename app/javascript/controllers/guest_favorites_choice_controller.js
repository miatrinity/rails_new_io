import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update(event) {        
    const originalRailsFlags = document.getElementById('rails-flags').textContent     
    let railsFlags = originalRailsFlags.split(' ')    
    const railsFlag = this.nameTarget.dataset.commandOutput    
    
    if(railsFlags.includes(railsFlag)) {
      const index = railsFlags.indexOf(railsFlag);
      
      railsFlags.splice(index, 1);
    } else {
      railsFlags.push(railsFlag)
    }
    
    document.getElementById('rails-flags').textContent = railsFlags.sort().join(' ').trim();
  }
}