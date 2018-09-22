$(document).ready(function() {
    var thisTap = $('.tab-sub').eq(0);

    $('.tab-sub').on('click', function() {
        var grey = '<span id="grey"></span>';
        var pink = '<span id="pink" style="width:0;left:45%"></span>';
        thisTap.append(grey);
        thisTap.children('a').css({
            'color': 'black'
        });
        thisTap.children('#pink').animate({
            'width': '0',
            'left': '45%'
        }, 400);
        $(this).append(pink);
        $(this).children('a').css({
            'color': '#f54a7e'
        });
        $(this).children('#pink').animate({
            'width': '650px',
            'left': '0'
        }, 400);
        thisTap = $(this);
        return false;
    });

    /*****************************************************/



    var date = new Date();

    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();

    if ((month + "").length < 2) {
        month = "0" + month;
    }


    if ((day + "").length < 2) {
        day = "0" + day;
    }

    var getDate = year + month + day;
    var stand = parseInt(getDate);


    var length = 0;
    var count = 0;
    var out = 0;
    var y_all = 0;
    var n_all = 0;



    $.ajax({
        type: 'GET',
        url: 'elist.do',
        dataType: 'json',
        success: function(res) {

            $(".new-image").hide();



            $("#event-list ul").empty();



            if (length == 0 && count == 0) {

                length = res.length;
            }




            for (var i = 0; i < res.length; i++) {

                if (res[i].end_date != null) {
                    var asff = res[i].end_date;
                    var test2 = asff.replace(/\-/g, '');
                    var test3 = parseInt(test2);
                    if (test3 > stand) {
                        y_all++;
                    }
                }

            }


            if (y_all < 10 && 0 < y_all) {
                var i = 0;

                while (i < y_all) {

                    asff = res[count].end_date;
                    test2 = asff.replace(/\-/g, '');
                    test3 = parseInt(test2);

                    if (test3 - stand > 0) {
                        $("#event-list ul").append('<li class="event" id="event1"><div class="event_mainpic"><a href="eventPage.do?num=' + res[count].event_num + '"><img id="mainpic" src="' + res[count].event_mainpic + '"/></a> </div> <div class="event_name"><p>' + res[count].event_name + '</p><p>' + res[count].start_date + "~" + res[count].end_date + '</p></div></li>');
                        out++;
                        i++;

                    }
                    count++;

                }


            } else if (y_all >= 10) {

                var i = 0;
                //alert(y_all);
                while (i < 10) {


                    asff = res[count].end_date;
                    test2 = asff.replace(/\-/g, '');
                    test3 = parseInt(test2);


                    if (test3 > stand) {
                        $("#event-list ul").append('<li class="event" id="event1"><div class="event_mainpic"><a href="eventPage.do?num=' + res[count].event_num + '"><img id="mainpic" src="' + res[count].event_mainpic + '"/></a></div><div class="event_name"><p>' + res[count].event_name + '</p></div></li>');
                        out++;
                        i++;

                    }
                    count++;
                }


            } else if (out == y_all) {
                alert("마지막 목록입니다.");
            }



        }


    });



    $('#tab').on('click', function() {

        length = 0;
        count = 0;
        out = 0;
        y_all = 0;
        n_all = 0;

        $.ajax({
            type: 'GET',
            url: 'elist.do',
            dataType: 'json',
            success: function(res) {

                $(".new-image").hide();

                $("#more").empty();
                $("#ser").empty();
                $("#event-list ul").empty();


                if (length == 0 && count == 0) {

                    length = res.length;
                }




                for (var i = 0; i < res.length; i++) {

                    if (res[i].end_date != null) {
                        var asff = res[i].end_date;
                        var test2 = asff.replace(/\-/g, '');
                        var test3 = parseInt(test2);
                        if (test3 > stand) {
                            y_all++;
                        }
                    }

                }


                if (y_all < 10 && 0 < y_all) {
                    var i = 0;

                    while (i < y_all) {

                        asff = res[count].end_date;
                        test2 = asff.replace(/\-/g, '');
                        test3 = parseInt(test2);

                        if (test3 > stand) {
                            $("#event-list ul").append('<li class="event" id="event1"><div class="event_mainpic"><a href="eventPage.do?num=' + res[count].event_num + '"><img id="mainpic" src="' + res[count].event_mainpic + '"/></a> </div> <div class="event_name"><p>' + res[count].event_name + '</p><p>' + res[count].start_date + "~" + res[count].end_date + '</p></div></li>');
                            out++;
                            i++;

                        }
                        count++;

                    }


                } else if (y_all >= 10) {

                    var i = 0;

                    while (i < 10) {


                        asff = res[count].end_date;
                        test2 = asff.replace(/\-/g, '');
                        test3 = parseInt(test2);


                        if (test3 > stand) {
                            $("#event-list ul").append('<li class="event" id="event1"><div class="event_mainpic"><a href="eventPage.do?num=' + res[count].event_num + '"><img id="mainpic" src="' + res[count].event_mainpic + '"/></a> </div> <div class="event_name"><p>' + res[count].event_name + '</p></div></li>');
                            out++;
                            i++;

                        }
                        count++;
                    }


                } else if (out == y_all) {
                    /*  alert("마지막 목록입니다."); */
                }



            }


        });

        return false;
    });



    $('#more').on('click', function() {
        if (doubleSubmitCheck()) {
            /*alert("마지막입니다.");*/
            return;
        }
        /*alert("클릭");*/



        $.ajax({
            type: 'GET',
            url: 'elist.do',
            dataType: 'json',
            success: function(res) {


                $(".new-image").show();



                if (n_all - out > 0) { 

                    var i = out;


                    while (i <= n_all) {


                        asff = res[count].end_date;
                        test2 = asff.replace(/\-/g, '');
                        test3 = parseInt(test2);
                        if (test3 < stand) {

                            $("#event-list ul").append('<li class="event" id="event1"><div class="event_mainpic"><a href="eventPage.do?num=' + res[count].event_num + '"><img id="mainpic" src="' + res[count].event_mainpic + '"/></a> </div> <div class="event_name"><p>' + res[count].event_name + '</p><p>' + res[count].start_date + "~" + res[count].end_date + '</p></div></li>');
                            i++;
                            out++;
                        }
                        count++;

                        $("#more").empty();
                        $("#more").append("더보기" + out);
                        $("#more").append("/" + n_all);

                    }


                } else if (n_all - out > 10) {


                    var i = 0;

                    while (i < 10) {




                        asff = res[count].end_date;
                        test2 = asff.replace(/\-/g, '');
                        test3 = parseInt(test2);


                        if (test3 < stand) {
                            $("#event-list ul").append('<li class="event" id="event1"><div class="event_mainpic"><a href="eventPage.do?num=' + res[count].event_num + '"><img id="mainpic" src="' + res[count].event_mainpic + '"/></a> </div> <div class="event_name"><p>' + res[count].event_name + '</p><p>' + res[count].start_date + "~" + res[count].end_date + '</p></div></li>');
                            out++;
                            i++;
                        }
                        count++;
                    }


                } else if (n_all == out) {
                    alert("마지막 목록입니다.");
                }

                /*    alert("마무리"); */
                $("#more").empty();
                $("#more").append("10개 더보기" + out);
                $("#more").append("/" + n_all);

            }


        });

        return false;
    });


    $('#tabbbaa').on('click', function() {

        doubleSubmitFlag = false;


        length = 0;
        count = 0;
        out = 0;
        y_all = 0;
        n_all = 0;

        $("#event-list ul").empty();

        /*	 alert("클릭");*/
        $.ajax({
            type: 'GET',
            url: 'elist.do',
            dataType: 'json',
            success: function(res) {

                $(".new-image").show();


                $("#more").empty();
                $("#event-list ul").empty();



                if (length == 0 && count == 0) {

                    length = res.length;
                }




                for (var i = 0; i < res.length; i++) {

                    if (res[i].end_date != null) {
                        var asff = res[i].end_date;
                        var test2 = asff.replace(/\-/g, '');
                        var test3 = parseInt(test2);
                        if (test3 < stand) {
                            n_all++;
                        }
                    }

                }


                if (n_all <= 10 && 0 < n_all) {
                    var i = 0;


                    while (i < n_all) {

                        asff = res[count].end_date;
                        test2 = asff.replace(/\-/g, '');
                        test3 = parseInt(test2);

                        if (test3 < stand) {
                            $("#event-list ul").append('<li class="event" id="event1"><div class="event_mainpic"><a href="eventPage.do?num=' + res[count].event_num + '"><img id="mainpic" src="' + res[count].event_mainpic + '"/></a> </div> <div class="event_name"><p>' + res[count].event_name + '</p><p>' + res[count].start_date + "~" + res[count].end_date + '</p></div></li>');
                            out++;
                            i++;
                        }
                        count++;

                    }




                } else if (n_all > 10) {

                    var i = 0;
                    /* alert(n_all);*/
                    while (i < 10) {


                        asff = res[count].end_date;
                        test2 = asff.replace(/\-/g, '');
                        test3 = parseInt(test2);


                        if (test3 < stand) {
                            $("#event-list ul").append('<li class="event" id="event1"><div class="event_mainpic"><a href="eventPage.do?num=' + res[count].event_num + '"><img id="mainpic" src="' + res[count].event_mainpic + '"/></a> </div> <div class="event_name"><p>' + res[count].event_name + '</p><p>' + res[count].start_date + "~" + res[count].end_date + '</p></div></li>');

                            out++;
                            i++;

                        }
                        count++;

                    }


                } else if (out == n_all) {
                    alert("마지막 목록입니다.");

                }

                $("#more").empty();
                $("#more").append("더보기" + out);
                $("#more").append("/" + n_all);




            }



        });
        return false;



    });


    if($('#content').ready()[0] != null){
    	$('#content').html(data).trigger("create");
    }
});

 
var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}


