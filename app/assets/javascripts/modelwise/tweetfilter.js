var loading = false;
var page_number = 1;
var disconnected = false;

var dis_connect = function(){
    disconnected = true;
}

var scrollCallback = function (){

    if(disconnected){
        return;
    }

    var scrollTop = $(window).scrollTop();
    var objBottom = $(document).height() - $(window).height() - 50;

    if ((scrollTop > objBottom) && !loading) {
        loading = true;
        apply_filter('append');
    }
}

jQuery(document).ready(function() {

    jQuery(window).scroll(scrollCallback);

    $('.filterbox').on('click', function(e){
        apply_filter('clear');
    });

    $( "#category_filter" ).change(function(e) {
        apply_filter('clear');
    });

    $( "#timeline_filter" ).change(function(e) {
        apply_filter('clear');
    });

    $('#btnshowlogin').on('click', function(e){
        e.preventDefault();
        $('#formlogin').modal();
    });

    $('#btn_ajax_user_no_thankyou').on('click', function(e){
        e.preventDefault();
        $('#formlogin').modal('hide');
    });


    $('#btn_ajax_user_waitlist').on('click', function(e){

        var email = $('#user_emaile').val();
        var data = {remote: true, commit: "Sign up", utf8: "✓",
            user: {email: email}};

        $.ajax({ url: '/tweets/fastsignup.json',
            type: 'POST',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
            data: data,
            success: function(response) {
                $("#div_existing_user_login").hide();
                $("#div_tweet_aftersignup").show();
            },
            error: function(response){

            }
        });
        return false;
    });
});

function apply_filter(caller) {
    // this means new filters are getting applied, and so
    // pagination on scroll will take into effect again
    disconnected = false;

    if(caller === 'clear'){
        page_number = 0;
    }

    var notification = iosOverlay({
        text: "Loading .."
    });

    var h = new Object(); // or just {}

    $(".ulfilters").each(function() {
        var cat = $(this).attr("data-filter-category");
        var vals = new Object();
        var counter = 0;
        $(this).find('input:checkbox').each(function(){

            if (this.checked) {
                vals[counter] = $(this).attr('value');
                counter = counter + 1;
            }
        });
        h[cat] = vals;
    });

    h['timeline'] = $('#timeline_filter').val();

    var data = {remote: true, utf8: "✓", category: $('#category_filter').val(),
        filter: h, page: page_number, mode: caller};

    $.ajax({
        url: '/tweets/filtertweet',
        type: 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
        data: data,
        success: function(response) {
            twttr.widgets.load();
            notification.hide();
            loading = false;
            page_number = page_number + 1;
        },
        error: function(){
            notification.hide();
            loading = false;
        }
    });
    return false;
}
