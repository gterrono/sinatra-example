helpers do
  def ensure_link_exists(keyword)
    link = Link.first(:keyword => keyword)
    if link
      yield link
    else
      404
    end
  end
end
