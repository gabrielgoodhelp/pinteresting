class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  	devise_parameter_sanitizer.for(:account_update) << :name
  end

  def render_stars(rating)
  content_tag :div, star_images(rating), :class => 'stars'
end

def star_images(rating)
  (0...5).map do |position|
    star_image(((rating-position)*2).round)
  end.join
end

def star_image(value)
  image_tag "/images/star-#{star_type(value)}.png", :size => '15x15'
end

def star_type(value)
  if value <= 0
    'off'
  elsif value == 1
    'half'
  else
    'on'
  end
end
end
