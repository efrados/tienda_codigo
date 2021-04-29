# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def bicon(icon, options = {})
    options.merge! class: "bi #{icon} #{options[:class]}"
    options.merge! style: (options[:style]).to_s
    content_tag :span, nil, options
  end
end
