class PhoneNumber
  def self.clean(input)
    res = input.gsub(/\W/, '').gsub(/^1/, '')
    res[/^[2-9]\d\d[2-9]\d\d\d{4}$/]
  end
end
