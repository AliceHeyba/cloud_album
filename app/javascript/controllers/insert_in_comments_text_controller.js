import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-comments-text"
export default class extends Controller {
  static targets = ["comments", "form"]
  static values = { position: String }
  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
  }


  // send(event) {
  //   event.preventDefault()

  //   fetch(this.formTarget.action, {
  //     method: "POST",
  //     headers: { "Accept": "application/json" },
  //     body: new FormData(this.formTarget)
  //     })
  //     .then(response => response.json())
  //     .then((data) => {
  //       if (data.inserted_item) {
  //         this.commentsTarget.insertAdjacentHTML("beforeend"), data.inserted_item)
  //       }
  //       this.formTarget.outerHTML = data.form
  //     })
  // }


}
