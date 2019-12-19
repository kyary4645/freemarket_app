module PurchaseHelper
  def price
    @item.price.to_s(:delimited, delimiter: ',')
  end
end