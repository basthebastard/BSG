class ArchivesController < ApplicationController
  def index
    @blogpost_by_day = Blogpost.find(:all, :order => "created_at DESC").group_by { |post| post.created_at.beginning_of_day }
  end

  def monthly_index
    @year = params[:year]
    @month = params[:month]
    @day = params[:day]
    @date = [@year,"/",@month].join("")
    start_date = Time.parse(@date).beginning_of_month
    end_date = Time.parse(@date).end_of_month
    @blogpost_array = Blogpost.where(:created_at => start_date..end_date).all
#	@blogpost = Blogpost.where(:created_at => (Time.now.midnight - 10.day)..Time.now.midnight)
  end
end