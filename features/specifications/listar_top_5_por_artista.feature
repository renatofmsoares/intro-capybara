#encoding: utf-8
#language: pt

Funcionalidade: Listar Top 5 músicas por artista no Spotify
  Como usuário não autenticado
  Quero ver quais são as musicas mais tocadas do meu artista preferido
  Para ver se minha musica favorita está entre as mais tocadas

Cenario: Musica Numb deve estar no top 5 das musicas do Linkin Park
  Dado que "NuMb" é a minha música favorita
  Quando procuro pela banda "Linkin Park" no spotify
  Então devo ver a minha música favorita entre as top 5
  
  
  