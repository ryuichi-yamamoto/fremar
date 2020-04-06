class CardsController < ApplicationController

  require "payjp"

  def new
  end

  def create
    Payjp.api_key = "sk_test_1ba767c5bffca296748263f9"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      # email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show", id: current_user.id
      else
        redirect_to action: "create"
      end
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = "sk_test_1ba767c5bffca296748263f9"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "confirmation", id: current_user.id
  end


  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "confirmation", id: current_user.id
    else
      Payjp.api_key = "sk_test_1ba767c5bffca296748263f9"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand 
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end

  def confirmation
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

end
