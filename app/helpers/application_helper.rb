# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def bicon(icon, options = {})
    options.merge! class: "bi #{icon} #{options[:class]}"
    options.merge! style: "font-size: 3rem; color: cornflowerblue;"
    content_tag :span, nil, options
  end
end
