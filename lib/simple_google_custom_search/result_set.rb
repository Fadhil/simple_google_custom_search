class SimpleGoogleCustomSearch::ResultSet
  attr_accessor :total, :total_pages, :item, :query
  
  def initialize(attrs={})
    @total = attrs[:total] || 0
    @total_pages = attrs[:total_pages] || 0
    @query = attrs[:query] || ""
    @item = attrs[:item] || []
  end
  
  def self.create_empty
    self.new({
      total: 0,
      total_pages: 0,
      query: "",
      item: []
    })
  end
end