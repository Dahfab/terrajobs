// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require trix
//= require rails.validations
//= require_tree .

$(document).ready(function() {  

// Job Posting Checkboxes 
    $('#job_highlight_checkbox').change(function() {
        if($(this).is(":checked")) {
            $('#free_checkbox').prop('checked', false);

        }else {
            $('#free_checkbox').prop('checked', true);
        }   
    });

    $('#free_checkbox').change(function() {
        if($(this).is(":checked")) {
            $('#job_highlight_checkbox').prop('checked', false);
        } 
    });


// Stripe Checkout
    var handler = StripeCheckout.configure({
        key: 'pk_test_oSdGE79t4Lyz2mlqIVbEzJAG',
        image: 'http://localhost:3000/assets/terrajobs-stripe.png',
        locale: 'auto',
        token: function(token) {
        // You can access the token ID with `token.id`.
        // Get the token ID to your server-side code for use.
        document.getElementById("stripeToken").value = token.id;
        document.getElementById("stripeEmail").value = token.email;
        document.getElementById("new_job").submit();
        }
    });

    function openStripe(e) {
        handler.open({
            name: 'Terrajobs',
            description: 'Joblisting hervorheben',
            currency: 'eur',
            amount: 9900,
            });
            e.preventDefault();
    }
    
// Only open when job_job_highlight_checkbox is checked
    $('#job_highlight_checkbox').change(function() {
        if($(this).is(":checked")) {

            document.getElementById('payment').addEventListener('click', openStripe);
        
            // Close Checkout on page navigation:
            window.addEventListener('popstate', function() {
                handler.close();
            });

        }else {
            document.getElementById('payment').removeEventListener('click', openStripe, false);
        } 
        });

    $('#free_checkbox').change(function() {
        if($(this).is(":checked")) {
            document.getElementById('payment').removeEventListener('click', openStripe, false);
        } 
    });
});

