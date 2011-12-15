require 'digest/md5'

module DashboardsHelper

  def gravatar (email)
    "http://www.gravatar.com/avatar/#{ Digest::MD5.hexdigest(email.strip.downcase) }"
  end
end
