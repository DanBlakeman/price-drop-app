module ProductsHelper

  def find_glyphicon_class(current_price, original_price)
    price_change = current_price - original_price
    if price_change > 0
      "glyphicon-arrow-up"
    elsif price_change < 0
      "glyphicon-arrow-down"
    else
      "glyphicon-minus"
    end
  end

  def find_amazon_id(url)
    if /\/dp\/(.*)\// =~ url
      /\/dp\/(.*)\//.match(url)[1]
    elsif /\/product\/(.*)\// =~ url
      /\/product\/(.*)\//.match(url)[1]
    elsif /\/product\/(.*)[\?]/ =~ url
      /\/product\/(.*)[\?]/.match(url)[1]
    else
      logger.warn "FAILED TO PARSE AMAZON ID FROM: #{url}"
      'no amazon id'
    end
  end

  def get_amazon_price amazon_id
    request = Vacuum.new('GB')
    request.associate_tag = 'pridro02-20'
    begin
      response = request.item_lookup(
        query: {'Condition'=>'New',
                'IdType'=>'ASIN',
                'ItemId'=>amazon_id,
                'Operation'=>'ItemLookup',
                'ResponseGroup'=>'OfferSummary'})
      response.to_h
    rescue
    end
  end

  def format_amazon_price_response(hashed_response)
    price = hashed_response['ItemLookupResponse']['Items']['Item']['OfferSummary']['LowestNewPrice']['Amount']
    price.to_i / 100.00
  end

end
