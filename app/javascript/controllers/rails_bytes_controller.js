import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update(event) {
    this.setCommandLineOutput()
    
    const currentlySelectedRailsByte = event.target
    
    this.updateActiveRailsByteAttribute(currentlySelectedRailsByte)
    this.lockMenuCardItems(currentlySelectedRailsByte)
  }
  
  setCommandLineOutput() {
    const railBytesCombos = JSON.parse(document.getElementById('rails-bytes-combos').textContent)
    
    const selectedRailsBytes = [...document.querySelectorAll("#tabs-classics [data-id=rails-menu-card] input")].filter(x => x.checked);
    const selectedRailsBytesIds = selectedRailsBytes.map(item => item.id )
        
    const railsBytesCombosKey = selectedRailsBytesIds.sort().map(id => id.replace('classics-tab-','')).join('@')
      
    
    const output = railBytesCombos[railsBytesCombosKey]
    const spacedOutput = ' ' + '--template ' + output
    const styledOutput = (output === '' ? '' : spacedOutput)
        
    document.getElementById('rails-bytes').textContent = styledOutput    
  }
  
  updateActiveRailsByteAttribute(currentlySelectedRailsByte) {
    // "//input[@id='classics-tab-frontend-stimulus-reflex']")[0].closest("li")    
    const currentlySelectedRailsByteRow = currentlySelectedRailsByte.closest('li')
    const allRailsBytesRows = [...currentlySelectedRailsByteRow.parentElement.children]
    
    allRailsBytesRows.forEach(element => element.setAttribute('data-active-rails-byte', 'false')) 
    
    currentlySelectedRailsByteRow.setAttribute('data-active-rails-byte', 'true')    
  }
  
  lockMenuCardItems(currentlySelectedRailsByte) {        
    const railsBytesLocks = JSON.parse(document.getElementById('rails-bytes-locks').textContent)
    
    const itemsToLock = railsBytesLocks[currentlySelectedRailsByte.id]
    for (const menuCardItemId in itemsToLock) {
      const menuCardItem = document.getElementById(menuCardItemId)
      
      if(menuCardItem.checked !== itemsToLock[menuCardItemId]) {
        menuCardItem.disabled = false
        menuCardItem.click()
      }
      
      menuCardItem.disabled = true
            
      const railsBytesLockMessage = document.getElementById(`${menuCardItemId}-rails-byte-lock`)
      railsBytesLockMessage.classList.remove('hidden')
    }    
  }
}