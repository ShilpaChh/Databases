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

end

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


# 7. Reload the SQL seeds before each test run




