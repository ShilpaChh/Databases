require 'artist_repository'

RSpec.describe ArtistRepository do

    def reset_artists_table
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' }) # ensure you use test DB here. 
        # This test db is used only for spec files. 
        # Note: When we run ruby app.rb, it uses the main table!
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_artists_table
    end

    it "find artist" do
        repo = ArtistRepository.new

        artists = repo.all # Should return all
        
        expect(artists.length).to eq(2) # => 2 as we are inserting 2 records in seeds_artists.sql
        expect(artists.first.id).to eq('1') # => 1
        expect(artists.first.name).to eq('Neha') # => 'Neha' 
    end

    ##### DATABASE CH5 - 'find' method being tested now
             
    it "returns Neha as single artist" do
            repo = ArtistRepository.new

            artist = repo.find(1)
            expect(artist.name).to eq  ('Neha')
            expect(artist.genre).to eq ('Indian Music')
    end

    it "returns King as another artist" do
            repo = ArtistRepository.new

            artist = repo.find(2)
            expect(artist.name).to eq  ('King')
            expect(artist.genre).to eq ('Indian Hip-Hop')
    end

    ##### DATABASE CH7 - create/delete/update methods being tested now
    it "creates a new artist" do
        repo = ArtistRepository.new
        new_artist = Artist.new
        new_artist.name = 'Beatles'
        new_artist.genre = 'Pop'

        repo.create(new_artist)

        artists = repo.all
        last_artist = artists.last

        expect(last_artist.name).to eq ('Beatles')
        expect(last_artist.genre).to eq ('Pop')
    end

    it "deletes artist with id 1" do
        repo = ArtistRepository.new

        id_to_delete = 1
        
        repo.delete(id_to_delete)
        
        all_artists = repo.all
        expect(all_artists.length).to eq(1)
        expect(all_artists.first.id).to eq('2')    
    end

    it "deletes two artists" do
        repo = ArtistRepository.new
        
        repo.delete(1)
        repo.delete(2)
        
        all_artists = repo.all
        expect(all_artists.length).to eq(0) # both artists from seeds have been deleted, so this shd return zero
    end

    it "updates the first artist with new values" do
        repo = ArtistRepository.new

        artist = repo.find(1) #  find artist 1
        
        artist.name = 'Something else' # update the name to anything u want
        artist.genre = 'Disco' # update the genre u like it to
        
        repo.update(artist) # this would update the artist 1
        
        updated_artist = repo.find(1) # as this method doesn't return anything, we use fresh find to look for the updated artist
        
        expect(updated_artist.name).to eq ('Something else')
        expect(updated_artist.genre).to eq ('Disco')
    end

    it "updates the first artist with new artist's name and not genre" do
        repo = ArtistRepository.new

        artist = repo.find(1) #  find artist 1
        
        artist.name = 'Jubin' # update the name to anything u want
        
        repo.update(artist) # this would update the artist 1
        
        updated_artist = repo.find(1) # as this method doesn't return anything, we use fresh find to look for the updated artist
        
        expect(updated_artist.name).to eq ('Jubin') # changing from Neha to Jubin
        expect(updated_artist.genre).to eq ('Indian Music')
    end

end