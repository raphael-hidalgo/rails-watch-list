import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
  }

  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      console.log(true);
      this.element.classList.add("navbar-transparent");
    } else {
      console.log(false);
      this.element.classList.remove("navbar-transparent");
    }
  }
}