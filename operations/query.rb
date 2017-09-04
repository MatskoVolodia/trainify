module Query
  def self.build_query(params)
    params.map{|key, value| "#{key}=#{value}"}.join('&')
  end
end