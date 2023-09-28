// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// import "@hotwired/turbo-rails"
// import "controllers"

//= require_tree
//= require flatpickr

document.addEventListener('DOMContentLoaded', function () {
    const dateRange = document.getElementById('date_range');

    if (dateRange) {
        const value = dateRange.attributes['data-possible-dates'].nodeValue;

        flatpickr('#date_range', {
            mode: "multiple",
            dateFormat: "Y-m-d",
            inline: true,
            enable: value.trim().split(','),
        });
    }
    
});