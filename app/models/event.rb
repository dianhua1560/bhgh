require "google/api_client"
require "google_drive"

class Event < ActiveRecord::Base
	def self.import
		doc_id = '10nOY6ijCbis32O6rVKNEndoi_lfqAolU3jenZnGk0H8'
		sheet_id = 0
		session = GoogleDrive.saved_session("drive_config.json")
		ws = session.spreadsheet_by_key(doc_id).worksheets[sheet_id]
		rows = ws.rows
		index = 0
		rows.each do |row|
			if index == 0
				index += 1
			else
				e = Event.where(
					title: row[0]
				).first_or_create
				e.description = row[1]
				e.time = Time.strptime(row[2], '%m/%d/%Y')
				e.save
			end
		end
	end
end
