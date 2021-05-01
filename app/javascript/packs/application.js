// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// global.toastr = require("toastr")
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@fortawesome/fontawesome-free/css/all"

// import './src/application.scss'
import toastr from 'toastr'
window.toastr = toastr

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require('data-confirm-modal')


import 'bootstrap'
import 'jquery'
import '../stylesheets/application'
import '../stylesheets/navbar'
import '../stylesheets/form'
import '../stylesheets/card'
import '../stylesheets/ticker'
import '../stylesheets/footer'
import '../stylesheets/scrollbar'
// import '../custom/testingIfjQueryWorks.js'
// import '../stylesheets/rfs'
// import '../stylesheets/normalize'

document.addEventListener('turbolinks:load', () => {
     $('[data-toggle="tooltip"]').tooltip()
     $('[data-toggle="popover"]').popover()
     $('.toast').toast({ autohide: false })
     $('#toast').toast('show')
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
