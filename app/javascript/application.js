// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
// ./packs/application.js
import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context));

const button = document.querySelector(".qr-toggle")
button.addEventListener("click", () => {
  document.querySelector(".qr-code").classList.toggle("d-none")
});
