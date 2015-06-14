class Admin::AdminController < ApplicationController
  before_action :ensure_admin

  def index
  end

  def users
    @users = User.all
  end

  def purchases
    @purchases = Purchase.all
  end

  def songs
    @songs = Song.all
  end

end
