class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: [:index, :show]
respond_to :html, :json
  def index

    #@portfolios1 = Portfolio.find_by_user_id(current_user.id)
    @portfolios = Portfolio.all
    respond_with(@portfolios)
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
  end

  def update
    @portfolio.update(portfolio_params)
    respond_with(@portfolio)
  end

  def destroy
    @portfolio.destroy
    respond_with(@portfolio)
  end

  private
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, :description, :work, :user_id)
    end
end
