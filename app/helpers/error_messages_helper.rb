module ErrorMessagesHelper
  # Render error messages for the given objects. The :message and :header_message options are allowed.
  def error_messages_for(*objects)
    options = objects.extract_options!
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten    
    unless messages.empty?
      if messages.count > 1 
        options[:header_message] ||= I18n.t(:"activerecord.errors.template.header.other", :default => "Invalid Fields")
        options[:message] ||= I18n.t(:"activerecord.errors.template.body.other", :default => "Correct the following errors and try again.")
      else
        options[:header_message] ||= I18n.t(:"activerecord.errors.template.header.one", :default => "Invalid Fields")
        options[:message] ||= I18n.t(:"activerecord.errors.template.body.one", :default => "Correct the following errors and try again.")
      end
      content_tag(:div, :class => "error_messages") do
        list_items = messages.map { |msg| content_tag(:li, msg) }
        content_tag(:h2, options[:header_message]) + content_tag(:p, options[:message]) + content_tag(:ul, list_items.join.html_safe)
      end
    end
  end

  module FormBuilderAdditions
    def error_messages(options = {})
      @template.error_messages_for(@object, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)
