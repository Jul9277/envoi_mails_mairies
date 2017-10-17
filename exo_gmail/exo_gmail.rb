require 'gmail'

gmail = Gmail.connect("leva3220@gmail.com", "Luc@s9277")
gmail.deliver do
  to "leva3220@gmail.com"
  subject "Having fun in Puerto Rico!"
  text_part do
    body "I did it!!!!!"
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Text of <em>html</em> message.</p>"
  end
  add_file "marshmallow.jpg"
end

=begin
#compter le nombre d'emails dans ma boite mail
gmail.inbox.count
puts gmail.inbox.count
=end

=begin
#vérifie que l'on est bien connecté
Gmail.connect("leva3220@gmail.com", "Luc@s9277")do |gmail|
	gmail.logged_in?
=end

