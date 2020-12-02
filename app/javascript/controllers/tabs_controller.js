import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['tab', 'panel']

  connect() {
    this.activeTabClasses = (this.data.get('activeTab') || 'active').split(' ')
    this.inactiveTabClasses = (this.data.get('inactiveTab') || 'inactive').split(' ') 
    this.showTab()
  }
  
  showTab() {
    this.tabTargets.forEach((tab, index) => {
      const panel = this.panelTargets[index]

      if (index === this.index) {
        panel.classList.remove('hidden')
        tab.classList.remove(...this.inactiveTabClasses)
        tab.classList.add(...this.activeTabClasses)
      } else {
        panel.classList.add('hidden')
        tab.classList.remove(...this.activeTabClasses)
        tab.classList.add(...this.inactiveTabClasses)
      }
    })
  }
  
  change(event) {
    event.preventDefault()
    
    this.index = this.tabTargets.indexOf(event.currentTarget)

    window.dispatchEvent(new CustomEvent('tsc:tab-change'))
  }
  
  get index() {
    return parseInt(this.data.get('index') || 0)
  }

  set index(value) {
    this.data.set('index', (value >= 0 ? value : 0))
    this.showTab()
  }  
}