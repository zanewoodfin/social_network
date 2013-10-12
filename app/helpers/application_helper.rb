module ApplicationHelper
  BASE_TITLE = "The Network"

  def full_title(page_title = '')
    if page_title.empty?
      BASE_TITLE
    else
      "#{BASE_TITLE} | #{page_title}"
    end
  end

  # sets heading to :heading, :title, or "The Network" in that priority
  def heading(page_heading = '', page_title = '')
    default_heading = BASE_TITLE
    if page_heading.empty? && page_title.empty?
      default_heading
    elsif page_heading.empty?
      page_title
    else
      page_heading
    end
  end

  def flash_class(type)
    "alert alert-" + case type
      when :success then "success"
      when :notice then "info"
      when :alert then "warning"
      when :error then "danger"
      else "invalid-type"
    end
  end

  def host
    if Rails.env.production?
      "http://zanes-social-network.herokuapp.com/"
    else
      "http://localhost:3000/"
    end
  end

  def header_links
    {
      "My Profile" => current_user,
      "Activity" => activities_path,
      "Users" => users_path,
      "Friends#{create_badge(current_user.friend_request_count)}" => friendships_path,
      "Messages#{create_badge(current_user.unread_message_count)}" => messages_path
    }
  end

  def format_time(time)
    formatted_time = if(cookies["browser.timezone"])
      time.in_time_zone(cookies["browser.timezone"]).strftime("%b %d, %Y %I:%M %P")
    else
      time.strftime("%b %d, %Y %I:%M %P %Z")
    end
    formatted_time.gsub(/0(\d:\d\d)/) { $1 }
  end

  def random_code(size = 20)
    token_chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    token_length = size
    Array.new(token_length) { token_chars[rand(token_chars.length)] }.join
  end

private

  def create_badge(num)
    if num > 0
      " <span class='badge'>#{num}</span>"
    else
      ""
    end
  end
end
