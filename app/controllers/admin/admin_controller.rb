class Admin::AdminController < ApplicationController
  before_action :ensure_admin

  def index
  end

  def songs
    @songs = Song.where('downloads > ?', 0).page(params[:page]).per(10)
    respond_to do |format|
      format.js
    end
  end

  def donations
    @donations = Donation.page(params[:page]).per(10)
    respond_to do |format|
      format.js 
    end
  end

end
