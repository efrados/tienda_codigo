# frozen_string_literal: true

class StaticPagesController < ApplicationController
  load_and_authorize_resource
  def about; end
end
