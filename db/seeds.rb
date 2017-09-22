section =  Section.create!(
  name: 'Vida em Equilíbrio',
  description: 'some section description',
  image_url: 'http://image-url'
)

subsection_mente = Subsection.create!(
  name: 'Mente Sã',
  section: section,
)

subsection_corpo = Subsection.create!(
  name: 'Corpo São',
  section: section,
)

subsection_espirito = Subsection.create!(
  name: 'Espírito Livre',
  section: section,
)

subsection_energia = Subsection.create!(
  name: 'Energia em Equilíbrio',
  section: section,
)

subsection_terra = Subsection.create!(
  name: 'Terra Viva',
  section: section,
)

category_educacao = Category.create!(
  name: 'Educação Emocional & Comunicação Não Violenta',
  description: 'some category description',
  subsection: subsection_mente,
)

category_meditacao = Category.create!(
  name: 'Meditação & Exercícios para a Mente',
  description: 'some category description',
  subsection: subsection_mente,
)

category_alimentacao = Category.create!(
  name: 'Alimentação',
  description: 'some category description',
  subsection: subsection_corpo,
)

category_consciencia = Category.create!(
  name: 'Consciência Corporal e Exercícios',
  description: 'some category description',
  subsection: subsection_corpo,
)

category_espiritualidade = Category.create!(
  name: 'Espiritualidade',
  description: 'some category description',
  subsection: subsection_espirito,
)

category_fe = Category.create!(
  name: 'Humanização, Fé e Ciência',
  description: 'some category description',
  subsection: subsection_espirito,
)

category_vida = Category.create!(
  name: 'Vida Integral',
  description: 'some category description',
  subsection: subsection_energia,
)

category_biofisica = Category.create!(
  name: 'Humanização, Fé e Ciência',
  description: 'some category description',
  subsection: subsection_energia,
)

category_verde = Category.create!(
  name: 'Vida Verde e Sustentabilidade',
  description: 'some category description',
  subsection: subsection_terra,
)

series = Series.create!(
  name: 'Os Portais da Alma',
  description: 'some series description',
  category: category_educacao,
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
  image_url: "http://lorempixel.com/573/322/animals",
  category: category_educacao,
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
  image_url: "http://lorempixel.com/573/322/sports",
  category: category_educacao,
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
  image_url: "http://lorempixel.com/573/322/people",
  category: category_educacao,
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
  image_url: "http://lorempixel.com/573/322/abstract",
  category: category_educacao,
)

video1_series = Video.create!(
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
  image_url: "http://lorempixel.com/573/322/nature",
  series: series,
)

video2_series = Video.create!(
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
  image_url: "http://lorempixel.com/573/322/nature",
  series: series,
)
