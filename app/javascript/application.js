// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// import "@hotwired/turbo-rails"
// import "controllers"

//= require_tree
//= require flatpickr

document.addEventListener('DOMContentLoaded', function () {
    loadGuestInviteConfirmationFlatpckr();
    loadInviteFlatpickr();
});

function loadInviteFlatpickr() {
    const elId = 'invite_date_range';
    const dateRange = document.getElementById(elId);

    if (dateRange) {
        flatpickr(`#${elId}`, {
            mode: "multiple",
            dateFormat: "Y-m-d",
        });
    }
}

function loadGuestInviteConfirmationFlatpckr() {
    const elId = 'date_range';
    const dateRange = document.getElementById(elId);

    if (dateRange) {
        const value = dateRange.attributes['data-possible-dates'].nodeValue;

        flatpickr(`#${elId}`, {
            mode: "multiple",
            dateFormat: "Y-m-d",
            inline: true,
            enable: value.trim().split(','),
        });
    }
}
