import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update(event) {
    this.setCommandLineOutput()
    
    const railsByteToSwitchTo = event.target
    this.railsBytesLocks = JSON.parse(document.getElementById('rails-bytes-locks').textContent)
    
    this.unLockMenuCardItems(railsByteToSwitchTo)
    this.revertRailsByteChangesToCurrentBaseState(railsByteToSwitchTo)
    
    this.updateActiveRailsByteAttribute(railsByteToSwitchTo)
    this.lockMenuCardItems(railsByteToSwitchTo)
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
  
  unLockMenuCardItems(railsByteToSwitchTo) {
    // the menu Card of the RailsByte is just clicked on
    const activeMenuCard = railsByteToSwitchTo.closest('ul')
    
    // which railsbyte is active right now INSIDE this ^^^ card
    const railsByteToSwitchFromRow = activeMenuCard.querySelector('li[data-active-rails-byte=true]')
    const railsByteToSwitchFrom = railsByteToSwitchFromRow.querySelector('input')
    
    const lockedItemIds = this.railsBytesLocks[railsByteToSwitchFrom.id]
    
    for (const lockedItemId in lockedItemIds) {
      const lockedItem = document.getElementById(lockedItemId)
      lockedItem.disabled = false
      
      const railsBytesLockMessage = document.getElementById(`${lockedItemId}-rails-byte-lock`)
      railsBytesLockMessage.classList.add('hidden')      
    }
  }
  
  revertRailsByteChangesToCurrentBaseState(railsByteToSwitchTo) {    
    this.baseStates = JSON.parse(document.getElementById('base-states').textContent)
        
    const currentBaseStateElement = [...document.querySelectorAll('input[id^=main-tab-base-setup]')].find( x => x.checked)
    const currentBaseState = currentBaseStateElement.id.split('-').slice(-1)[0] + '_state'
      
    const activeMenuCard = railsByteToSwitchTo.closest('ul')
        
    const railsByteToSwitchFromRow = activeMenuCard.querySelector('li[data-active-rails-byte=true]')
    const railsByteToSwitchFrom = railsByteToSwitchFromRow.querySelector('input')
    
    const lockedItemIds = this.railsBytesLocks[railsByteToSwitchFrom.id]    
    
    for (const lockedItemId in lockedItemIds) {
      const itemName = lockedItemId.split('-').slice(-1)[0]
      const menuCardName =  lockedItemId.split('-').slice(-2)[0]
      
      console.log(itemName)
      const itemInBaseState = this.baseStates[currentBaseState]['main_tab']['rails_flags_config'][menuCardName][itemName]['checked']
      
      const lockedItem = document.getElementById(lockedItemId)
      
      if(lockedItem.checked !== itemInBaseState) {
        lockedItem.click()
      }      
    }
  }
  
  updateActiveRailsByteAttribute(railsByteToSwitchTo) {
    // "//input[@id='classics-tab-frontend-stimulus-reflex']")[0].closest("li")    
    const railsByteToSwitchToRow = railsByteToSwitchTo.closest('li')
    const allRailsBytesRows = [...railsByteToSwitchToRow.parentElement.children]
    
    allRailsBytesRows.forEach(element => element.setAttribute('data-active-rails-byte', 'false')) 
    
    railsByteToSwitchToRow.setAttribute('data-active-rails-byte', 'true')    
  }
  
  lockMenuCardItems(railsByteToSwitchTo) {        
    const itemsToLock = this.railsBytesLocks[railsByteToSwitchTo.id]
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