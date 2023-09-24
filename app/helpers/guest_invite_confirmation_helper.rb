require 'date'

module GuestInviteConfirmationHelper
    def format_date_header(date_str)
        date = Date.parse date_str
        wday = Date::DAYNAMES[date.wday]
        month = Date::MONTHNAMES[date.month]
        
        "#{wday}, #{month} #{date.day}, #{date.year}"
    end
end
