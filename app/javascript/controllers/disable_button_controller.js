import { Controller } from "@hotwired/stimulus"
export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller")
  }
  disable(event) {
    event.preventDefault();
    this.element.innerText = "Confirmed";
    event.target.disabled = true;
    event.target.classList.add('btn-confirmed');
  }
}
