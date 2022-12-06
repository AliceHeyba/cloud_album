class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :find ]

  def home
  end

  def find
  end
end
