class BusinessesController < ApplicationController

  before_filter :find_all_businesses
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @business in the line below:
    present(@page)
  end

  def show
    @business = Business.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @business in the line below:
    present(@page)
  end

protected

  def find_all_businesses
    @businesses = Business.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/businesses").first
  end

end
