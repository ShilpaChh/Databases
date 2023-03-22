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

# ### databases/challenges/05_test_driving_find_method.md
# ######## Test-driving a Repository class "find" method

artist = artist_repository.find(1) # to select a single record and not an array as we did for 'all' method
    ## this takes an argument -> id
puts ('First artist: ') + artist.name
puts ('Genre of first music: ') + artist.genre

artist = artist_repository.find(6) # to select a single record and not an array as we did for 'all' method
    ## this takes an argument -> id
puts ('Sixth artist is: #{artist.name}')
puts ('Sixth music is of genre: #{artist.genre}')


####################### OUTPUT #####################
        # ➜  music_library git:(main) ✗ ruby app.rb
        # #<Artist:0x000000013308f370 @id="1", @name="Pixies", @genre="Rock">
        # #<Artist:0x000000013308f190 @id="2", @name="ABBA", @genre="Pop">
        # #<Artist:0x000000013308f000 @id="3", @name="Taylor Swift", @genre="Pop">
        # #<Artist:0x000000013308ee48 @id="4", @name="Nina Simone", @genre="Pop">
        # #<Artist:0x000000013308ecb8 @id="5", @name="Massive Attack", @genre="Alternative">
        # #<Artist:0x000000013308eb28 @id="6", @name="King", @genre="Indian Hip-Hop">
        # First artist: Pixies
        # Genre of first music: Rock
        # Sixth artist is: #{artist.name}
        # Sixth music is of genre: #{artist.genre}

####################################################
