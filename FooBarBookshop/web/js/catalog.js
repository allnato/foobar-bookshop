var qsRegex;
var $productItems = $('.catalog-items').isotope({
  itemSelector: '.item-card',
  getSortData: {
    name: '.item-name',
    price: '.item-price parseFloat',
    reviews: '.item-review parseInt',
    date: '.item-update'
  },
  filter: function() {
    return qsRegex ? $(this).text().match( qsRegex ) : true;
  },
  layoutMode: 'masonry'
});
$productItems.isotope('layout');

// use value of search field to filter
var $quicksearch = $('#search-filter').keyup( debounce( function() {
  qsRegex = new RegExp( $quicksearch.val(), 'gi' );
  $productItems.isotope();
}, 200 ) );

// debounce so filtering doesn't happen every millisecond
function debounce( fn, threshold ) {
  var timeout;
  return function debounced() {
    if ( timeout ) {
      clearTimeout( timeout );
    }
    function delayed() {
      fn();
      timeout = null;
    }
    timeout = setTimeout( delayed, threshold || 100 );
  }
}

var sort_direction = 'ascending';
var sort_type = 'name';

$('.sort-direction-btn').click(function(event) {
  if (sort_direction === 'ascending'){
    sort_direction = 'descending';
    $productItems.isotope({
      sortBy : sort_type,
      sortAscending: false
    });
    $('.sort-direction-text').text('Descending');
    $('.sort-direction-logo').removeClass('fa-long-arrow-up');
    $('.sort-direction-logo').addClass('fa-long-arrow-down');
  }
  else {
    sort_direction = 'ascending';
    $productItems.isotope({
      sortBy : sort_type,
      sortAscending: true
    });
    $('.sort-direction-text').text('Ascending');
    $('.sort-direction-logo').removeClass('fa-long-arrow-down');
    $('.sort-direction-logo').addClass('fa-long-arrow-up');
  }
});

$('.sort-type').click(function(event) {
  sort_type = $(this).text().toLowerCase();
  $('.sort-type-text').text(sort_type);
  $productItems.isotope({sortBy : sort_type});
});

$('.sidebar-nav').stick_in_parent({
  parent: '.content-main'
});

$(window).resize(function(event) {
  if ($(this).width() <= 768 ) {
    $(".sidebar-nav").trigger("sticky_kit:detach");
  }
  else {
    $(".sidebar-nav").stick_in_parent({recalc_every: 1});
  }
});
