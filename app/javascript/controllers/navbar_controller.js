import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
  }

  updateNavbar() {
    if (window.scrollY >= 500) {
      this.element.classList.remove("bg-light");
    } else {
      this.element.classList.add("bg-light");
    }
  }
}
