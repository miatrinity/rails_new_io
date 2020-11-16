import { Controller } from "stimulus"

export default class extends Controller {

  update(event) {
    const sanitizedId = event.target.id.replace('main-tab-base-setup-','')
    const initialStateValue = `data-${sanitizedId}-state`
    
    this.setStateForAllMenuItems(initialStateValue);
    this.setApiFlag(sanitizedId);
  }
  
  setStateForAllMenuItems(initialStateValue) {
    const menuItems = [...document.querySelectorAll(`input[${initialStateValue}]`)];
          
    menuItems.forEach(menuItem => {
      if(String(menuItem.checked) !== menuItem.getAttribute(initialStateValue)) {
        menuItem.click();
      }      
    })    
  }
  
  setApiFlag(sanitizedId) {
    const apiFlag = (sanitizedId === 'api') ? ' --api' : ''
    
    document.getElementById('api-flag').textContent = apiFlag    
  }  
}