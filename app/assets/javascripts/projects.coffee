# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(".projects.new, .projects.edit").ready ->
    selectedType = "url"
    $(".urlType").on "click", ->
        selectedType = $(this).attr('data-class')
        if selectedType == "url"
            $("#yt").removeClass("selected")
            $(this).addClass("selected")
            $("#projectUrl").attr("placeholder", "http://www...")
            $("#isYoutube").val(false)
        else if selectedType == "yt"
            $("#url").removeClass("selected")
            $(this).addClass('selected')
            $("#projectUrl").attr("placeholder", "https://www.youtube.com/watch?v=...")
            $("#isYoutube").val(true)



    $("#projectUrl").on "change", ->
        if selectedType == "url"
            url = "http://capture.heartrails.com/320x300/shorten?" + $(this).val()

        else if selectedType == "yt"
            return if $(this).val().match(/www.youtube.com\/watch?v=/)
            if $(this).val().match(/&/)
                v = $(this).val().match(/v=(.+?)&/)[1]
            else
                v = $(this).val().match(/v=(.+)/)[1]
            url = "https://i.ytimg.com/vi/#{v}/mqdefault.jpg"

        image_complement(url)


    image_complement = (url) ->
        $("#projectImage").attr("src", url)
        $("#projectImagePath").val(url)
        $("#projectImage").show() 


$(".projects.edit").ready ->
    $("#projectTags").tagit
        fieldName: "project[tag_list]",
        singleField: true,
        allowSpaces: true,
        availableTags: gon.available_tags

    if gon.project_tags?
        for tag in gon.project_tags
            $("#projectTags").tagit "createTag", tag

$(".projects.index").ready ->
    $(".projectsList").masonry
        itemSelector: ".project",
        gutterWidth: 10,
        columnWidth: 320,
        isAnimated: true,
        isFitWidth: true,
        animationOptions: {
            duration: 500,
            easing: 'swing'
        }

    $(".project").hide()
    $(".project").each (i) ->
        $(this).delay(i * 100).fadeIn(1000)

    $(".link").on "click", ->
        $(this).find(".thisLink").toggle()

    $("#projects").infinitescroll
        loading: {
            img: "http://www.fastpic.jp/images.php?file=7260234218.gif",
            msgText: "loading..."
        }
        navSelector: ".pagination" # selector for the paged navigation (it will be hidden)
        nextSelector: ".pagination a[rel=next]" # selector for the NEXT link (to page 2)
        itemSelector: "#projects .project" # selector for all items you'll retrieve
    , (elem) ->
        $this = $(elem).css({opacity: 0})
        $this.animate({opacity: 1})
        $(".projectsList").masonry "appended", $this, true




$(".projects.new").ready ->
    $("#projectTags").tagit
        fieldName: "project[tag_list]",
        singleField: true,
        allowSpaces: true,
        availableTags: gon.available_tags

