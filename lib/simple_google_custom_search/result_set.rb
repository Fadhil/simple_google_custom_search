class SimpleGoogleCustomSearch::ResultSet
  attr_accessor :total, :total_pages, :item
  
  def initialize(attrs={})
    @total = attrs[:total] || 0
    @total_pages = attrs[:total_pages] || 0
    @item = attrs[:item] || []
  end
  
  def self.create_empty
    self.new({
      total: 0,
      total_pages: 0,
      item: []
    })
  end
end