import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  
  copy() {        
    const tempInput = document.createElement('input')
    tempInput.setAttribute(
      'value',
      this.sourceTarget.textContent.trim()
    )
    document.body.appendChild(tempInput)
    tempInput.select()
    document.execCommand('copy')
    
    document.getElementById('copied-to-clipboard-notice').classList.remove('hidden')
    document.getElementById('copied-to-clipboard-notice').classList.add('block')

    document.getElementById('copy-to-clipboard').classList.add('hidden')
    document.getElementById('copy-to-clipboard').classList.remove('block')

    
    
    setTimeout(function() {
      document.getElementById('copy-to-clipboard').classList.remove('hidden')
      document.getElementById('copy-to-clipboard').classList.add('block')
  
      document.getElementById('copied-to-clipboard-notice').classList.add('hidden')
      document.getElementById('copied-to-clipboard-notice').classList.remove('block')  
    }, 1200);    
    
    document.body.removeChild(tempInput)          
  }
}
