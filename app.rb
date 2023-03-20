# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

    # # Perform a SQL query on the database and get the result set.
    # sql = 'SELECT id, title FROM albums;'
    # result = DatabaseConnection.exec_params(sql, [])

    # # Print out each record from the result set .
    # result.each do |record|
    #   p record
    # end

    # # Perform a SQL query on the database and get the result set.
    # sql1 = 'SELECT * FROM artists;'
    # result1 = DatabaseConnection.exec_params(sql1, [])

    # # Print out each record from the result set .
    # result1.each do |record1|
    #   p record1
    # end

artist_repository = ArtistRepository .new

artist_repository.all.each do |artist|
    p artist
end