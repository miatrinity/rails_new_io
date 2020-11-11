import { Controller } from "stimulus"

export default class extends Controller {
    
  update(event) {
    const initialStateValue = `data-${event.target.id}-state`
    
    const menuItems = [...document.querySelectorAll(`input[${initialStateValue}]`)];
          
    menuItems.forEach(menuItem => {
      if(String(menuItem.checked) !== menuItem.getAttribute(initialStateValue)) {
        menuItem.click();
      }      
    })
    
  }
}