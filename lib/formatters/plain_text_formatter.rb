class PlainTextFormatter
  def format(head, pars_data)
    puts("####----#{head}----###")
    pars_data.each do |url, count, title|
      puts("#{url} \t #{count} #{title}")
    end
  end
end
