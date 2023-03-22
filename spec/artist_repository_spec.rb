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

end