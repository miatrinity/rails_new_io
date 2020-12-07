import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'hamburger', 'close', 'navigation' ]
  
  toggleHamburger() {
    this.hamburgerTarget.classList.remove('block')
    this.hamburgerTarget.classList.add('hidden')
    
    this.closeTarget.classList.remove('hidden')
    this.closeTarget.classList.add('block')
    
    this.navigationTarget.classList.remove('hidden')    
  }
  
  toggleClose() {
    this.hamburgerTarget.classList.remove('hidden')
    this.hamburgerTarget.classList.add('block')
    
    this.closeTarget.classList.remove('block')
    this.closeTarget.classList.add('hidden')  
    
    this.navigationTarget.classList.add('hidden')    
  }
}