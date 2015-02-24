class CardsController < ApplicationController

  def index
    render json: Card.all
  end

  def show
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  private

  def card_params
    params.require(:card).permit(:title, :back)
  end
end
