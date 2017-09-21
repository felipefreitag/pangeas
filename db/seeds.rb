section =  Section.create!(
  name: 'foo section',
  description: 'some section description',
  image_url: 'http://image-url'
)

subsection = Subsection.create!(
  name: "bar subsection",
  section: section,
)

category = Category.create!(
  name: 'baz category',
  description: 'some category description',
  subsection: subsection,
)

video = Video.create!(
  name: 'foo bar video',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia
    Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia tradicional
    e a Quântica. Ele sua fala ele mostra que o modelo comportamental',
  information: 'Palestrante: Amit Goswami Tema da Palestra: Psicologia Quântica
    Integrativa Local: Palácio dos Festivais - Gramado Evento: Conferência Internacional
    de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia
    Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia tradicional
    e a Quântica. Ele sua fala ele mostra que o modelo comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela
    sua participação no filme "Quem somos nós?". Com diversos livros publicados
    e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: "163721649",
  category: category,
)
