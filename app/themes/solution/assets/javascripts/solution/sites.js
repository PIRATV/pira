$(function(){
    $(".calculon").click(function(){
        var result = 0
        $("input:checkbox:checked").each(function(elem){
            result += parseInt($(this).val())
        })
        $("input:radio:checked").each(function(elem){
            result += parseInt($(this).val())
        })
        $("#calculon").text(result.toLocaleString() + ' р.')
    })
})