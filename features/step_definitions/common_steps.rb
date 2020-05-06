require "minitest/autorun"
require 'pry'

Dado("que {string} é a minha música favorita") do |nome_musica|
  @minha_musica_favorita = nome_musica
  
  #@minha_musica_favorita = @tools.titlecase(nome_musica)
end

Quando("procuro pela banda {string} no spotify") do |nome_banda|
  visit 'https://open.spotify.com/'

  sidenav_search_btn = find('a[aria-label="Search"]')
  sidenav_search_btn.click

  header_search_input = find('input[data-testid="search-input"]')
  header_search_input.set nome_banda

  artists_section = find('section[aria-label="Artists"]')
  first_artist = artists_section.find('div[class$="852-scss"]', :text => "#{nome_banda}", match: :first)
  first_artist.click

end

Então("devo ver a minha música favorita entre as top {int}") do |expected_ranking|
  
    toptracks_section = find('section[class=" artist-toptracks"]')

    toptracks_hash = {}
    toptracks_section.all('div.tracklist-name').each_with_index do |song, index|
        toptracks_hash[index+1] = song.text
    end
    current_ranking = toptracks_hash.key(@minha_musica_favorita)

    assert_msg = "Era esperado que a música \"#{@minha_musica_favorita}\" estivesse pelo menos na posição \"#{expected_ranking}\", mas ela está na posição \"#{current_ranking}\"."
    assert(current_ranking <= expected_ranking, assert_msg)

    sleep 5

end
