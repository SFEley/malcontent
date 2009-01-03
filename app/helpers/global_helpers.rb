module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  
    
    # Takes the message passed by Merb and wraps it in CSS for styling. 
    # Handles both hash-style and string-style messages. 
    def styled_message
      if @message
        tag :div, :id => "flash" do
          # Sometimes messages are strings; sometimes they're hashes
          if @message.is_a?(Hash)
            @message.each {|key, value| tag :div, value, :class => key}
          else
            tag :div, @message.to_s, :class => "notice"
          end
        end
      end
    end

  end
end
