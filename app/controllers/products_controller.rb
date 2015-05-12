require 'vacuum'

class ProductsController < ApplicationController
  include ProductsHelper

  def index
    @product = Product.new
    @products = Product.all.reverse
  end

  def new
    @product = Product.new
  end

  def create
    return redirect_to '/submission' if find_amazon_id(sanitize_params[:url]) == 'no amazon id'
    amazon_id = find_amazon_id(sanitize_params[:url])
    product = product_from_amazon(amazon_id)
    hash = sanitize_params.merge({ title: product[:title], price: product[:price], image: product[:image] })
    @product = Product.create(hash)
    redirect_to '/'
  end

  def sanitize_params
    params.require(:product).permit(:url, :budget)
  end

  def submission
  end

  private

  def product_from_amazon(amazon_id)
    format_amazon_response(get_amazon_response(amazon_id))
  end

  def get_amazon_response amazon_id
    request = Vacuum.new('GB')
    request.associate_tag = 'pridro02-20'
    response = request.item_lookup(
      query: {'Condition'=>'New',
              'IdType'=>'ASIN',
              'ItemId'=>amazon_id,
              'Operation'=>'ItemLookup',
              'ResponseGroup'=>'Images,ItemAttributes,OfferSummary'})
    response.to_h
  end

  def format_amazon_response(hashed_response)
    title = hashed_response['ItemLookupResponse']['Items']['Item']['ItemAttributes']['Title']
    price = hashed_response['ItemLookupResponse']['Items']['Item']['OfferSummary']['LowestNewPrice']['Amount']
    image = hashed_response['ItemLookupResponse']['Items']['Item']['MediumImage']['URL']
    { title: title, price: price.to_i / 100.00, image: image}
  end

end
