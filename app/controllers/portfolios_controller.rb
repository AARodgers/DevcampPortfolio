class PortfoliosController < ApplicationController
  before_action :set_porfolio_item, only: [:edit, :update, :show, :destroy]
  #before you call any portfolio controller actions, call the method set_portfolio_item (found in private methods to this class), but only for those four actions
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "The record was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Record was removed." }
    end
  end

  private
  # methods under private are only to be called within this class, other methods you can call outside of class
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end

  def set_porfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
