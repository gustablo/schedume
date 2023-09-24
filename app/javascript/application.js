// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// import "@hotwired/turbo-rails"
// import "controllers"

//= require flatpickr
document.addEventListener('DOMContentLoaded', function () {
    
    const dateRange = document.getElementById('date_range');
    
    flatpickr('#date_range', {
        mode: "multiple",
        dateFormat: "Y-m-d",
        inline: true,
        enable: dateRange.defaultValue.trim().split(',')
    });
});