class Tools
  def titlecase(string)
    string.downcase.gsub(/\b('?[a-z])/) { $1.capitalize }
  end
end
