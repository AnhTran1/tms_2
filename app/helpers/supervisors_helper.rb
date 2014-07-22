module SupervisorsHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(supervisor)
    gravatar_id = Digest::MD5::hexdigest(supervisor.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: supervisor.name, class: "gravatar")
  end
end