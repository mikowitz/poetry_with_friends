class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    render text: "for now...", layout: true
  end
end
