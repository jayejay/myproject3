
$(document).on('turbolinks:load',function(){
    $('.product-column').matchHeight();

    $('.alert').delay(2000).fadeOut(1500);

    $('.rating').raty({path: '/assets', scoreName:'comment[rating]'});

    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
});
