// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// import "@hotwired/turbo-rails"
// import "controllers"

//= require flatpickr
document.addEventListener('DOMContentLoaded', function () {
    flatpickr('#date_range', {
        mode: "multiple",
        dateFormat: "Y-m-d",
        inline: true
    });
});