class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  def index
    render json: Card.all
  end

  def show
    render json: @card
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      render json: Card.find(@card.id)
    else
      render json: Card.all
    end
  end

  def destroy
    @card.destroy
    head :no_content
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :back)
  end
end
