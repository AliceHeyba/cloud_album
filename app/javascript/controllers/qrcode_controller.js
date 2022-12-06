import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["qr"]
  connect() {
    console.log("Hello World!");
  }
  toggle() {
    this.qrTarget.classList.toggle("d-none")
  }
}
