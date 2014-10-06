module ApplicationHelper

  def time_since_post(dt)
    if dt > Time.now.beginning_of_day
      str = "#{time_ago_in_words(dt).gsub('about', '')} ago"
    else
      str = dt.strftime("%b %d, %Y")
    end
    str
  end
end
