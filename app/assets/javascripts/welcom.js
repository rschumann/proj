$(function () {
    $("#tasks_table tbody td.title").each(function () {
        $(this).qtip({
            content:{
                url:$(this).find('a:first').attr('href'),
                method:'get'
            },
            style:{
                width:400,
                padding:5,
                background:'#eeeeee',
                color:'black',
                textAlign:'center',
                border:{
                    width:7,
                    radius:5,
                    color:'#aaaaaa'
                },
                tip:'topLeft',
                name:'dark' // Inherit the rest of the attributes from the preset dark style
            }
        });
    })
});