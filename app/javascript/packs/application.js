// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap-icons/font/bootstrap-icons.css'
import 'bootstrap/js/src/collapse'
import 'bootstrap/js/src/alert'
import bootstrap_tooltip from 'bootstrap/js/src/tooltip'
import 'bootstrap/js/src/dropdown'
import '../stylesheets/application'
require.context('../images', true)

Rails.start()
ActiveStorage.start()
import 'controllers'

document.addEventListener('turbo:load', function() {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    tooltipTriggerEl.addEventListener("click", function( event ) {
      var tooltip = bootstrap_tooltip.getInstance(tooltipTriggerEl);
      tooltip.hide();
    });
    return new bootstrap_tooltip(tooltipTriggerEl)
  })

  const collapser = document.querySelectorAll(".collapser");
  collapser.forEach(function(el) {
    el.addEventListener("click", function( event ) {
      var id = el.id.replace("-answer", "");
      document.getElementById(id + "-answer").classList.toggle('show');
      document.getElementById(id).classList.toggle('show');
    }, false);
  });

  const cards = document.querySelectorAll(".product-card");
  cards.forEach(function(el) {
    el.addEventListener("mouseenter", function( event ) {
      event.target.classList.add('shadow');
      event.target.style.border = "1px solid black"
      event.target.querySelector(".product-description").classList.toggle('show');
      event.target.querySelector(".favorites").classList.toggle('show');
      setTimeout(function() {
        event.target.style.border = ""
      }, 800);
    }, false);
    el.addEventListener("mouseleave", function( event ) {
      event.target.classList.remove('shadow');
      event.target.querySelector(".product-description").classList.remove('show');
      event.target.querySelector(".favorites").classList.remove('show');
    }, false);
  });
});
import "controllers"
