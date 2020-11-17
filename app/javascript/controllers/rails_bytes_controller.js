import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]
    
  update() {
    
    
    const railBytesCombos = JSON.parse(document.getElementById('rails-bytes-combos').textContent)
    
    const selectedRailsBytes = [...document.querySelectorAll("#tabs-classics [data-id=rails-menu-card] input")].filter(x => x.checked);
    const selectedRailsBytesIds = selectedRailsBytes.map(item => item.id )
    
    console.log(selectedRailsBytesIds)
    
    const railsBytesCombosKey = selectedRailsBytesIds.sort().map(id => id.replace('classics-tab-','')).join('@')
    
    console.log(railsBytesCombosKey)
    
    const output = railBytesCombos[railsBytesCombosKey]
    const spacedOutput = ' ' + '--template ' + output
    const styledOutput = (output === '' ? '' : spacedOutput)
        
    document.getElementById('rails-bytes').textContent = styledOutput
  }
}