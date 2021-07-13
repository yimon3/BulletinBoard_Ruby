// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery
//= require moment

import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

import "controllers"

// ./packs/application.js
import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context))

// import Flatpickr
import Flatpickr from 'stimulus-flatpickr'

// Import style for flatpickr
import 'flatpickr/dist/themes/dark.css'

// Manually register Flatpickr as a stimulus controller
application.register('flatpickr', Flatpickr)

import {} from 'jquery-ujs'

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap
//= require jquery_ujs

