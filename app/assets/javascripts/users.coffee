# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(".users.show").ready ->
    $(".myPortfolio").masonry
        itemSelector: ".portfolio",
        gutterWidth: 10,
        columnWidth: 320,
        isAnimated: true,
        isFitWidth: true,
        animationOptions: {
            duration: 500,
            easing: "swing"
        }


    $("#pdf").on "click", ->
        html = $(".myPortfolio").html()
        $("[name=html]").val(html)
        return true
