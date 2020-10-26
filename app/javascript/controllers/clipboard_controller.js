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
    const noticeElement = document.querySelector('.animate-notice')
    
    noticeElement.style.display='block';
    
    setTimeout(function() {
      noticeElement.style.display='none';
    }, 3000);    
    
    document.body.removeChild(tempInput)          
  }
}