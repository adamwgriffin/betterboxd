import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dismiss() {
    this.element.remove()
  }
  
  autoDismiss() {
    setTimeout(() => {
      this.element.style.transition = 'opacity 0.5s'
      this.element.style.opacity = '0'
      setTimeout(this.dismiss, 500)
    }, 5000)
  }
  
  connect() {
    this.autoDismiss()
  }
}
