// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

//import * as bootstrap from '../../node_modules/bootstrap/dist/js/bootstrap.bundle'

window.bootstrap = bootstrap;

//window.bootstrap = require('bootstrap');
//window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js');
//window.Modal = bootstrap.Modal;