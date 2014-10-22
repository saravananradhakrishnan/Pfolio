class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!
    respond_to :html, :json

  def index
    @image = '/images/portfolio/slider/pic2.jpg'
    @portfolios = Portfolio.all
    respond_with(@portfolios)

  end

  def view

     render :file => "templates/p2/index"

  end

  def show
    respond_with(@portfolio)
  end

  def new
    @portfolio = Portfolio.new
    respond_with(@portfolio)
  end

  def edit
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.save
    respond_with(@portfolio)
     Image.save(params[:portfolio])
  end

  def update
  debugger
    @portfolio.update(portfolio_params)
    respond_with(@portfolio)
    Image.save(params[:portfolio])
  end

  def destroy
  debugger
   Image.destroy(params)
    @portfolio.destroy
    respond_with(@portfolio)
  end
  private
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, :description, :work, :user_id, :image_id)
    end


end
