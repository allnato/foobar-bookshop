changeContainerSize();

var $table = $('#userTable');
$(document).ready(function() {
  $table.bootstrapTable({
    classes: 'table table-reponsive table-striped table-no-bordered',
    smartDisplay: true,
    showToggle: true,
    showColumns: true,
    minimumCountColumns: 3,
    pagination: true,
    onlyInfoPagination: false,
    search: true,
    toolbar: '.table-toolbar',
    toolbarAlign: 'right',
    pageSize: 10,
    formatShowingRows: function(pageFrom, pageTo, totalRows) {

    },
    formatRecordsPerPage: function(pageNumber) {

    },
    formatDetailPagination: function(totalRows) {
      return ;
    },
    onClickRow: function(row, $element){
    },
  });
});

function actionFormatter(value, row, index){
  return [
    '<a class="action-link lock" href="javascript:void(0)" title="Lock">',
    '<i class="fa fa-lock text-danger fa-lg"></i>',
    '</a>',
    '<a class="action-link unlock" href="javascript:void(0)" title="Unlock">',
    '<i class="fa fa-unlock text-success fa-lg"></i>',
    '</a>'
  ].join('');
}

function cellStyle(value, row, index) {
  if( value.toLowerCase() == 'locked'){
    return {
      classes: 'danger'
    }
  }
  else{
    return {
      classes: 'success'
    }
  }
}


// Change container to fluid
// If window size is <992
$(window).resize(function(event) {
  changeContainerSize();
});

// Change container size if window size is <992
function changeContainerSize(){
  if ( $(window).width() < 992 ){
    $('.admin-container').removeClass('container');
    $('.admin-container').addClass('container-fluid');
  }

  else {
    $('.admin-container').removeClass('container-fluid');
    $('.admin-container').addClass('container');
  }
}
