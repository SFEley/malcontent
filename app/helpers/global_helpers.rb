module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  
    
    # Takes the message passed by Merb and wraps it in CSS for styling. 
    # Handles both hash-style and string-style messages. 
    def styled_message
      if !message.blank?
        tag :div, :id => "flash" do  # I assume it'll become 'flash' again in Rails 3
          if message.is_a?(Hash)
            message.each {|key, value| tag :div, h(value), :class => h(key)}
          else
            tag :div, h(message.to_s), :class => "notice"
          end
        end
      end
    end

  end
end
