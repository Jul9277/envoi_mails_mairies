require 'pry'
require "google_drive"
require_relative "scrapping.rb"
# Crée une session. Cela incitera les informations d' identification via la ligne de commande pour la 
# première fois et enregistrez - le config.json fichier pour des usages ultérieurs. 
# Voir ce document pour savoir comment créer config.json: 
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md 
session =  GoogleDrive::Session.from_config ("client_id.json ")

# récupère une feuille de calcul
my_spreadsheet = session.spreadsheet_by_title ("emails_mairies44")

# créer une feuille de calcul si elle n'existe pas déjà
if my_spreadsheet.nil?
	my_spreadsheet = session.create_spreadsheet ("emails_mairies44")
end

#obtenir la première feuille de travail et la renommer
my_worksheet = my_spreadsheet.worksheets[0]
my_spreadsheet.title = "annuaire_mairies44"

i = 1
projet = additionner
projet.each do | nom_ville, email_mairie|
	my_worksheet[i,1] = nom_ville
  	my_worksheet[i,2] = email_mairie
  i += 1
end

# Enregistrer mon travail
my_worksheet.save


