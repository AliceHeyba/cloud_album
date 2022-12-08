import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard-copy"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
}
