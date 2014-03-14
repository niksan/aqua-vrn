class MainController < ApplicationController

  def index
    @page = (Page.by_key(:main) || Page.new)
  end
  
end
