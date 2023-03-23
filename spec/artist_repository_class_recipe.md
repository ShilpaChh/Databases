# MODEL AND REPOSITORY CLASSES DESIGN RECIPE

# 1 Design and Create the Table


# 2. Create Test SQL seeds


# 3. 


--- ruby

class Artists
end

class ArtistRepository
end

----

<!-- 
➜  music_library git:(main) ✗ psql -h 127.0.0.1 music_library_test < spec/seeds_artists.sql
TRUNCATE TABLE
INSERT 0 1
INSERT 0 1 
-->


# 4 . Implement the Model Class

class Artist
    attr_accessor : id, :name, :genre
end

# 5. Define the Repository Class Interface

# => Table Name: artists

# => Repository class
# (in lib/artist_repository.rb)

class ArtistRepository

    def all
        # Executes the SqL query:
        # SELECT id, name, genre FROM artists;
    end

    ######## Databases CH 5 - find method being appended #######
    # select a single record
    # Given the id in argument (a number)

    def find(id)
        # Exceutes the SQL query:
        # SELECT id, name, genre FROM artists WHERE id = $1;

        # Returns a single artist
    end

    <!-- DATABASES: CH 7 - Test-driving write operations -->

    <!-- Insert a new artist record
    Takes an Artist oblect in argument -->
    def create(artist)
      <!-- Executes the SQL query
      INSERT INTO artists (name, genre) VALUES ($1, $2);
      
      Doesn't need to return anything (only creates the record) -->
    end

    <!-- Deletes an artist record
    given its id -->
    def delete(id)
      <!-- Executes the SQL:
      DELETE FROM artists WHERE id = $1;
      
      Returns nothing (only deletes the record) -->
    end

    <!-- Updates an artist record
    Takes an Artist object (with the updated fields) -->
    def update(artists)
      <!-- Executes the SQL:
      UPDATE artists SET name = $1, genre = $2 WHERE id = $3;
      
      Returns nothing (only updates the record) -->
    end

end

# DATABASES: CH 7 - Test-driving write operations
<!-- Work in the project directory music_library you've worked on before.

Test-drive the method .create on the class AlbumRepository from the previous project music_library. 

repository = AlbumRepository.new

album = Album.new
album.title = 'Trompe le Monde'
album.release_year = 1991
album.artist_id = 1

repository.create(album)

all_albums = repository.all

# The all_albums array should contain the new Album object
-->

# 6. Write Test Examples

# eg 1
Get all  the artists:

repo = ArtistRepository.new

artists = repo.all # Should return all
artists.length # => 2 as we are inserting 2 records in seeds_artists.sql
artists.first.id # => 1
artists.first.name # => 'Neha' 

# eg 2
Get a single artist

repo = ArtistRepository.new

artist = repo.find(1)
artist.name # => 'Neha' ###### as per the INSERT statement in seeds_artists.sql
artist.genre # => 'Indian Music'

# eg 3
Get another single artist

repo = ArtistRepository.new

artist = repo.find(2)
artist.name # => 'King' ###### as per the INSERT statement in seeds_artists.sql
artist.genre # => 'Indian Hip-Hop'

# eg 4 for - DATABASES: CH 7 - Test-driving write operations - create method
<!- Create a new artist -->
repo = ArtistRepository.new

artist = Artist.new
artist.name # => 'Beatles'
artist.genre # => 'Pop'

repo.create(artist) # => nil

artists = repo.all

last_artist = artists.last
last_artist.name # => 'Beatles'
last_artist.genre # => 'Pop'

# eg 5 for - DATABASES: CH 7 - Test-driving write operations - delete method
<!- Create a new artist -->
repo = ArtistRepository.new

id_to_delete = 1

repo.delete(id_to_delete)

all_artists = repo.all
all_artists.length # => 1 # when we start we start with 2 artists as per seeds_artists_sql, so shd return 1
all_artists.first.id # => '2' # as we deleted id 1, so, only id 2 shd be remaining

# eg 6 for - DATABASES: CH 7 - Test-driving write operations - update method
<!- Create a new artist -->
repo = ArtistRepository.new

artist = repo.find(1) #  find artist 1

artist.name = 'Something else' # update the name to anything u want
artist.genre = 'Disco' # update the genre u like it to

repo.update(artist) # this would update the artist 1

updated_artist = repo.find(1) # as this method doesn't return anything, we use fresh find to look for the updated artist

updated_artist.name  # => 'Something else'
updated_artist.genre # => 'Disco'

# 7. Reload the SQL seeds before each test run




