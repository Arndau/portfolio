class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :projects ]

  def home
  end
end
