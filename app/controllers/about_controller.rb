class AboutController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  after_action :skip_all_authorization
  def index

  end

  private

  def skip_all_authorization
   skip_policy_scope
   skip_authorization
  end

end
