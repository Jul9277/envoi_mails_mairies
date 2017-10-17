require  "google_drive"
require  "gmail"


def get_annuaire44_from_google_drive
	 file = {}

	 session =  GoogleDrive::Session.from_config ("client_id.json ")
	 my_spreadsheet = session.spreadsheet_by_title ("annuaire44")
	 my_worksheet = my_spreadsheet.worksheets[0]
	 # utilisation du code pour selectionner toutes les cellules
	 (1..my_worksheet.num_rows).each do |row|
	 	file[my_worksheet[row,1]] = my_worksheet[row,2]
	 	end
	 	return file
end

#envoi de mails à partir du fichier annuaire_mairies44
def send_email_to_townhall(townhall_name, townhall_email)

gmail = Gmail.connect("leva3220@gmail.com", "Luc@s9277")

gmail.deliver do
  	to townhall_email
  	subject "Formation The Hacking Project à #{townhall_name}"
  		text_part do
    	body "Text of plaintext message."
  		end
  		html_part do
    	content_type 'text/html; charset=UTF-8'
    	body "<p>Bonjour,<br/>
    			<br/>
				Je m'appelle Juliette, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau.<br/>
				La formation s'appelle <strong>The Hacking Project</strong> <em>(http://thehackingproject.org/)</em>. <br/>
				Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes.<br/>
				Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.<br/>
				Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées.<br/>
				Le modèle d'éducation de <strong>The Hacking Project</strong> n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{townhall_name} !<br/>
				Charles, co-fondateur de <strong>The Hacking Project</strong> pourra répondre à toutes vos questions : 06.95.46.60.80 <br/>
				<br/>
				Cordialement,</p>
				<br/>
				<p>Juliette</p> "
  		end
  reply_to "charles@thehackingproject.org"
		end
	end


#envoi_email
get_annuaire44_from_google_drive.each do |townhall_name, townhall_email|
	send_email_to_townhall(townhall_name, townhall_email)
end
