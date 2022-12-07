// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ClipboardController from "./clipboard_controller"
application.register("clipboard", ClipboardController)

import ClipboardCopyController from "./clipboard_copy_controller"
application.register("clipboard-copy", ClipboardCopyController)

import ControllerController from "./controller_controller"
application.register("controller", ControllerController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InsertInCommentsTextController from "./insert_in_comments_text_controller"
application.register("insert-in-comments-text", InsertInCommentsTextController)

import QrcodeController from "./qrcode_controller"
application.register("qrcode", QrcodeController)
