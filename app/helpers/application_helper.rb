module ApplicationHelper
    def flash_message
        if flash
            flash[:message] 
        end
    end

end
