import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play"
export default class extends Controller {
  connect() {
  }

  sound(event) {
    // console.log(event);
    const sound = new Audio(this.element.attributes.url.value);
    sound.play();
    console.log("sound played")
  }
}
