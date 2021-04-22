// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap-icons/font/bootstrap-icons.css'
import 'bootstrap/js/src/collapse'
import 'bootstrap/js/src/dropdown'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import 'controllers'

document.addEventListener('turbolinks:load', function() {
  const cards = document.querySelectorAll(".product-card");
  cards.forEach(function(el) {
    el.addEventListener("mouseenter", function( event ) {
      event.target.classList.add('shadow');
      event.target.style.border = "1px solid black"
      event.target.querySelector(".product-description").classList.toggle('show');
      setTimeout(function() {
        event.target.style.border = ""
      }, 800);
    }, false);
    el.addEventListener("mouseleave", function( event ) {
      event.target.classList.remove('shadow');
      event.target.querySelector(".product-description").classList.remove('show');
    }, false);
  });
});