import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update(event) {
    this.railsBytesLocks = JSON.parse(document.getElementById('rails-bytes-locks').textContent)
    this.railBytesCombos = JSON.parse(document.getElementById('rails-bytes-combos').textContent)
    this.baseStates = JSON.parse(document.getElementById('base-states').textContent)    
    
    const railsByteToSwitchTo = event.target
    const railsByteToSwitchFrom = this.railsBytesToSwitchFrom(railsByteToSwitchTo)

    const railsByteURL = this.railBytesCombos[
      this.railsBytesCombosKey(
        this.selectedRailsBytesIds()
      )
    ]
    
    this.unLockMenuCardItemsFor(railsByteToSwitchFrom)
    this.revertRailsByteChangesToCurrentBaseStateFor(railsByteToSwitchFrom)
    this.updateActiveRailsByteAttributeFor(railsByteToSwitchTo)
    
    this.updateAllMenuCardItemsForActiveRailsBytes()
    this.setCommandLineOutput(railsByteURL)    
    this.displayVerifyMySetupLink(railsByteURL)
  }
  
  displayVerifyMySetupLink(railsByteURL) {
    if(railsByteURL === '') {
      document.getElementById('verify-my-setup-link').classList.add('hidden') 
    } else {
      document.getElementById('verify-my-setup-link').classList.remove('hidden') 
    }
    
  }
  
  setCommandLineOutput(railsByteURL) {
    document.getElementById('rails-bytes').textContent = this.styledCommandLineOutput(railsByteURL)
  }
    
  unLockMenuCardItemsFor(railsByteToSwitchFrom) {    
    const lockedItemIds = this.railsBytesLocks[
      railsByteToSwitchFrom.id
    ]
      
    this.unlockAndHideLockMessageFor(lockedItemIds)
  }
  
  revertRailsByteChangesToCurrentBaseStateFor(railsBytesToSwitchFrom) {    
    this.revertToCurrentBaseState(
      this.lockedItemIdsFor(
        railsBytesToSwitchFrom
      )
    )
  }
  
  updateActiveRailsByteAttributeFor(railsByteToSwitchTo) {    
    const railsByteToSwitchToRow = railsByteToSwitchTo.closest('li')
    const allRailsBytesRows = [...railsByteToSwitchToRow.parentElement.children]
    
    this.deactivateRailsBytesFor(allRailsBytesRows)
    this.activateRailsByteFor(railsByteToSwitchToRow)    
  }
  
  deactivateRailsBytesFor(allRailsBytesRows) {
    allRailsBytesRows.forEach(element => element.setAttribute('data-active-rails-byte', 'false')) 
  }
  
  activateRailsByteFor(railsByteToSwitchToRow) {
    railsByteToSwitchToRow.setAttribute('data-active-rails-byte', 'true')    
  }
  
  setAndLockMenuCardItemsFor(railsByteToSwitchTo) {        
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
  
  updateAllMenuCardItemsForActiveRailsBytes() {
    const activeRailsBytes = [...document.querySelectorAll("li[data-active-rails-byte=true] input")]
    activeRailsBytes.forEach(activeRailsByte => this.setAndLockMenuCardItemsFor(activeRailsByte))    
  }
    
  railsBytesCombosKey(selectedRailsBytesIds) {
    return selectedRailsBytesIds.
      sort().
      map(id => id.replace('classics-tab-','')).
      join('@')    
  }
  
  selectedRailsBytesIds() {
    return [...document.querySelectorAll("#tabs-classics [data-id=rails-menu-card] input")].
      filter(x => x.checked)
      .map(item => item.id )    
  }
  
  styledCommandLineOutput(railsByteURL) {
    const spacedOutput = ' ' + '--template ' + railsByteURL
    return (railsByteURL === '' ? '' : spacedOutput)
  }
  
  railsBytesToSwitchFrom(railsByteToSwitchTo) {
    const activeMenuCard = railsByteToSwitchTo.closest('ul')
        
    const railsByteToSwitchFromRow = activeMenuCard.querySelector('li[data-active-rails-byte=true]')
    return railsByteToSwitchFromRow.querySelector('input')
  }
  
  unlockAndHideLockMessageFor(lockedItemIds) {
    for (const lockedItemId in lockedItemIds) {
      const lockedItem = document.getElementById(lockedItemId)
      lockedItem.disabled = false
      
      const railsBytesLockMessage = document.getElementById(`${lockedItemId}-rails-byte-lock`)
      railsBytesLockMessage.classList.add('hidden')      
    }
  }
  
  revertToCurrentBaseState(lockedItemIds) {
    const currentBaseStateElement = [...document.querySelectorAll('input[id^=main-tab-base-setup]')].find( x => x.checked)
    const currentBaseState = currentBaseStateElement.id.split('-').slice(-1)[0] + '_state'
    
    for (const lockedItemId in lockedItemIds) {
      const itemName = lockedItemId.split('-').slice(-1)[0]
      const menuCardName =  lockedItemId.split('-').slice(-2)[0]
            
      const itemInBaseState = this.baseStates[currentBaseState]['main_tab']['rails_flags_config'][menuCardName][itemName]['checked']
      
      const lockedItem = document.getElementById(lockedItemId)
      
      if(lockedItem.checked !== itemInBaseState) {
        lockedItem.click()
      }      
    }
  }
  
  lockedItemIdsFor(railsByteToSwitchFrom) {    
    return this.railsBytesLocks[railsByteToSwitchFrom.id]        
  }
}