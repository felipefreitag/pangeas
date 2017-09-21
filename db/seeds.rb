section =  Section.create!(
  name: 'Vida em Equilíbrio',
  description: 'some section description',
  image_url: 'http://image-url'
)

subsection = Subsection.create!(
  name: 'Mente Sã',
  section: section,
)

category = Category.create!(
  name: 'Educação Emocional & Comunicação Não Violenta',
  description: 'some category description',
  subsection: subsection,
)

series = Series.create!(
  name: 'Os Portais da Alma',
  description: 'some series description',
  category: category,
)

video1 = Video.create!(
  name: 'Conheça a Psicologia Quântica',
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

video2 = Video.create!(
  name: 'Parto Humanizado',
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

video3 = Video.create!(
  name: 'Pocket Show Banda Curasom',
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

video4 = Video.create!(
  name: 'Encontro com Sri Prem Baba',
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

video_series1 = Video.create!(
  name: 'Os Portais da Alma parte 1',
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
  series: series,
)

video_series2 = Video.create!(
  name: 'Os Portais da Alma parte 2',
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
  series: series,
)
