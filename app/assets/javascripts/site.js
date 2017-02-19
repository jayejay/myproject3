
$(document).on('turbolinks:load',function(){

    $('.alert').delay(2000).fadeOut(1500);

    $('.rating').raty({path: '/assets', scoreName:'comment[rating]'});

    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });

    $('.image-zoom').elevateZoom({
        zoomType: 'lens',
        lensShape: 'round',
        lensSize: 150
    });
});
