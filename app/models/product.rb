class Product < ActiveRecord::Base

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      product_hash = row.to_hash # exclude the price field
      product = Product.where(id: product_hash["id"])

      if product.count == 1
        product.first.update_attributes(product_hash)
      else
        Product.create!(product_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)

  # validates :title, :description, :image_url, presence: true
  # validates :price, numericality: {greater_than_or_equal_to: 0.01}
  # validates :title, uniqueness: {case_sensitive: false}
  # validates :image_url, allow_blank: true, format: {
  #   with: %r{\.(gif|jpg|png)\Z}i,
  #   message: 'must be a URL for a GIF, JPG or PNG image.'
  # }

end
