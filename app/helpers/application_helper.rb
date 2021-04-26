# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def bicon(icon, options = {})
    options.merge! class: "bi #{icon} #{options[:class]}"
    options.merge! style: "#{options[:style]}"
    content_tag :span, nil, options
  end

end
