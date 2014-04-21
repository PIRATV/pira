module ProductionHelper
  def bbcode text
    text.gsub! '<', '&lt;'
    text.gsub! '>', '&gt;'
    while text =~ /(\[(div|p|h\d|span|ul|li|strong|sup|em|i|t(?:body|head|able)|t[dr])([^\]]+?)?\](.*?)\[\/\2\])/ium do
      text.scan(/(\[(div|p|h\d|span|ul|li|strong|sup|em|i|t(?:body|head|able)|t[dr])([^\]]+?)?\](.*?)\[\/\2\])/ium).each do |match|
        text.gsub! match[0], "<#{match[1]}#{match[2]}>#{match[3]}</#{match[1]}>"
      end
    end

    while text =~ /(\[img\s*?src="([^"]+?)"\s*?alt="([^"]*?)"\s*?style="([^"]*?)"\])/ium do
      text.scan(/(\[img\s*?src="([^"]+?)"\s*?alt="([^"]*?)"\s*?style="([^"]*?)"\])/ium).each do |match|
        text.gsub! match[0], image_tag(image_path(match[1]), alt: match[2], style: match[3])
      end
    end
    while text =~ /(\[a(?:\s*?href="([^"]+?)")?(?:\s*?alt="([^"]*?)")?(?:\s*?style="([^"]*?)")?(?:\s*?class="([^"]*?)")?\](.+?)\[\/a\])/ium do
      text.scan(/(\[a(?:\s*?href="([^"]+?)")?(?:\s*?alt="([^"]*?)")?(?:\s*?style="([^"]*?)")?(?:\s*?class="([^"]*?)")?\](.+?)\[\/a\])/ium).each do |match|
        #text.gsub! match[0], link_to(match[4], create_url(match[1]), alt: match[2], style: match[3])
        text.gsub! match[0], ''
      end
    end
    text.gsub '[br]', '<br>'
  end
end