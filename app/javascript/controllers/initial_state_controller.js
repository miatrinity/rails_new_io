import { Controller } from "stimulus"

export default class extends Controller {
    
  update(event) {
    const sanitizedId = event.target.id.replace('base-setup-','')
    const initialStateValue = `data-${sanitizedId}-state`
    
    const menuItems = [...document.querySelectorAll(`input[${initialStateValue}]`)];
          
    menuItems.forEach(menuItem => {
      if(String(menuItem.checked) !== menuItem.getAttribute(initialStateValue)) {
        menuItem.click();
      }      
    })
    
  }
}