require_relative './artist'

class ArtistRepository

    def all
        sql = 'SELECT id, name, genre FROM artists;'
        result_set = DatabaseConnection.exec_params(sql, [])

        artists = []

        result_set.each do |record|
            artist = Artist.new
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']

            artists << artist
        end 
        return artists
    end

    ##### Database CH5 - find method being added now
    def find(id)
        sql = 'SELECT id, name, genre FROM artists WHERE id = $1;'
        sql_params = [id] ### as we used $ above we have to bind this place holder to an actual value with exec_params

        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]

        artist = Artist.new
        artist.id = record['id']
        artist.name = record['name']
        artist.genre = record['genre']

        return artist
    end

    # CH 7 - create method
    def create(artist)
        sql = 'INSERT INTO artists (name, genre) VALUES ($1, $2);'
        sql_params = [artist.name, artist.genre]

        DatabaseConnection.exec_params(sql, sql_params) # result_set not reqd as we are not requiring anything to return, we are just creating new record

        return nil
    end

     # CH 7 - delete method
    def delete(id)
        sql = 'DELETE FROM artists WHERE id = $1;'
        sql_params = [id]

        DatabaseConnection.exec_params(sql, sql_params) # result_set not reqd as we are not requiring anything to return, we are just creating new record

        return nil
    end

     # CH 7 - update method
     def update(artist)
        sql = 'UPDATE artists SET name = $1, genre = $2 WHERE id = $3;'
        sql_params = [artist.name, artist.genre, artist.id]

        DatabaseConnection.exec_params(sql, sql_params) # result_set not reqd as we are not requiring anything to return, we are just creating new record

        return nil
    end

end