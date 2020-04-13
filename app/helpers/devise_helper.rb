module DeviseHelper

  def devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    messages = resource.errors.full_messages.each do |errmsg|
      html += <<-EOF
      <div class="alert alert-danger alert-dismissible" role="alert">
        <p class="error_msg">#{errmsg}<span class="no-icon">&times;</span></p>
      </div>
      EOF
    end
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end