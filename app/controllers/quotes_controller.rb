class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def create
    quote_params = get_quote.body
    Quote.create(quote_params)
    redirect_to quotes_path
  end

  def show
    @quote = Quote.find(params[:id])
  end
  
  def delete
   quote= Quote.find(params[:id])
    quote.destroy
    redirect_to quotes_path
  end

  private

  def get_quote
    @response = Unirest.post "https://andruxnet-random-famous-quotes.p.mashape.com/?cat=movies",
  headers:{
    "X-Mashape-Key" => "OAeeRC5ECumsht9joxbpWmXH8wOsp1W9wK4jsnbgrOqAtlu1fG",
    "Content-Type" => "application/x-www-form-urlencoded",
    "Accept" => "application/json"
  }
  end
end
