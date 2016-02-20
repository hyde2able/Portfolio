module ApplicationHelper
    def lazy_image_tag(source, options={})
        options['data-original'] = source
        if options[:class].blank?
            options[:class] = "lazy"
        else
            options[:class] = "lazy #{options[:class]}"
        end
        image_tag("noimage.png", options)
    end

end
