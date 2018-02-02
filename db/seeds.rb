# frozen_string_literal: true

user = User.create!(
  first_name: 'foo',
  last_name: 'bar',
  email: 'foo@bar.com',
  password: '123456',
  cpf: '1234567890',
  address: 'foo',
  address_number: '42',
  zip_code: '123',
  city: 'foo',
  state: 'foo'
)

User.create!(
  first_name: 'john',
  last_name: 'doe',
  email: 'john@doe.com',
  password: '123456',
  cpf: '1234567890',
  address: 'foo',
  address_number: '42',
  zip_code: '123',
  city: 'foo',
  state: 'foo'
)

Subscription.create!(
  user: user,
  recurrence: 'monthly',
  state: 'active'
)

section_events = Section.create!(
  name: 'Eventos & Pesquisa',
  description: 'some section description',
  image_url: 'http://image.ibb.co/h3KBZG/Icone_Eventose_Pesquisas.png'
)

section = Section.create!(
  name: 'Vida em Equilíbrio',
  description: 'some section description',
  image_url: 'http://image.ibb.co/ek13gw/Icone_Vidaem_Equilibrio.png'
)

section_courses = Section.create!(
  name: 'Cursos Pangeas',
  description: 'some section description',
  image_url: 'http://image.ibb.co/dhkkuG/Icone_Cursos_Pangeas.png'
)

subsection_events = Subsection.create!(
  name: 'events',
  section: section_events
)

subsection_courses = Subsection.create!(
  name: 'courses',
  section: section_courses
)

subsection_mente = Subsection.create!(
  name: 'Mente Sã',
  section: section
)

subsection_corpo = Subsection.create!(
  name: 'Corpo São',
  section: section
)

subsection_espirito = Subsection.create!(
  name: 'Espírito Livre',
  section: section
)

subsection_energia = Subsection.create!(
  name: 'Energia em Equilíbrio',
  section: section
)

subsection_terra = Subsection.create!(
  name: 'Terra Viva',
  section: section
)

category_events = Category.create!(
  name: 'Eventos',
  description: 'some category description',
  subsection: subsection_events
)

category_other_events = Category.create!(
  name: 'Outros Eventos',
  description: 'some category description',
  subsection: subsection_events
)

category_talks = Category.create!(
  name: 'Palestras Avulsas',
  description: 'some category description',
  subsection: subsection_events
)

Category.create!(
  name: 'Ecologia Celular',
  description: 'O Dr. Carlos Braghini e a Pangeas tem a alegria de trazer a'\
  ' atualização de todos os estudos que deram origem ao livro Ecologia Celular'\
  ' agora em um formato de video aulas. Aprenda tudo sobre a visão sistêmica'\
  ' da saúde onde quer que você esteja. Você também pode comprar as aulas'\
  ' individualmente.',
  subsection: subsection_courses
)

Category.create!(
  name: 'Meditação Guiada iAwake',
  description: 'O ritmo é a linguagem básica da natureza. Agora, imagine usar'\
  ' todo o poder dessa ressonância de maneira consciente para definir seu'\
  ' humor e marcar os estados das ondas cerebrais que você deseja. É isso que'\
  ' estamos trazendo aqui. Você pode acessar todos os áudios e aulas ou'\
  ' comprar individualmente.',
  subsection: subsection_courses
)

Category.create!(
  name: 'Conhece-te (Educação Emocional)',
  description: 'O curso de educação emocional Conhece-te é uma capacitação'\
  ' composta por 7 módulos. Nessas aulas online a Autoconsciência é vivenciada'\
  ' na prática para proporcionar uma jornada com foco no desenvolvimento'\
  ' intrapessoal. É dentro desse profundo processo de autoconhecimento que a'\
  ' vida ganha nova base.',
  subsection: subsection_courses
)

category_educacao = Category.create!(
  name: 'Educação Emocional & Comunicação Não Violenta',
  description: 'some category description',
  subsection: subsection_mente
)

Category.create!(
  name: 'Meditação & Exercícios para a Mente',
  description: 'some category description',
  subsection: subsection_mente
)

Category.create!(
  name: 'Alimentação',
  description: 'some category description',
  subsection: subsection_corpo
)

Category.create!(
  name: 'Consciência Corporal e Exercícios',
  description: 'some category description',
  subsection: subsection_corpo
)

Category.create!(
  name: 'Espiritualidade',
  description: 'some category description',
  subsection: subsection_espirito
)

Category.create!(
  name: 'Humanização, Fé e Ciência',
  description: 'some category description',
  subsection: subsection_espirito
)

Category.create!(
  name: 'Vida Integral',
  description: 'some category description',
  subsection: subsection_energia
)

Category.create!(
  name: 'Humanização, Fé e Ciência',
  description: 'some category description',
  subsection: subsection_energia
)

Category.create!(
  name: 'Vida Verde e Sustentabilidade',
  description: 'some category description',
  subsection: subsection_terra
)

series = Series.create!(
  name: 'Os Portais da Alma',
  description: 'some series description',
  category: category_educacao
)

Video.create!(
  name: 'Conheça a Psicologia Quântica',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/animals',
  category: category_educacao
)

Video.create!(
  name: 'Parto Humanizado',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/sports',
  highlighted: true,
  category: category_educacao
)

Video.create!(
  name: 'Pocket Show Banda Curasom',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/people',
  category: category_educacao
)

Video.create!(
  name: 'Encontro com Sri Prem Baba',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/abstract',
  category: category_educacao
)

Video.create!(
  name: 'Os Portais da Alma parte 1',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  series: series
)

Video.create!(
  name: 'Os Portais da Alma parte 2',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  series: series
)

event1 = Series.create!(
  name: 'Destaque Psicologia Quântica',
  description: 'some series description',
  category: category_events,
  highlighted: true,
  image_url: 'http://lorempixel.com/573/322/nature'
)

event2a = Series.create!(
  name: 'Primeiro Congresso Internacional',
  description: 'some series description',
  category: category_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: '5° Congresso Saúde Terapia Quântica',
  description: 'some series description',
  category: category_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: 'Primeiro Congresso Internacional',
  description: 'some series description',
  category: category_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: '5° Congresso Saúde Terapia Quântica',
  description: 'some series description',
  category: category_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: 'Primeiro Congresso Internacional',
  description: 'some series description',
  category: category_other_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: '5° Congresso Saúde Terapia Quântica',
  description: 'some series description',
  category: category_other_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: 'Primeiro Congresso Internacional',
  description: 'some series description',
  category: category_other_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: '5° Congresso Saúde Terapia Quântica',
  description: 'some series description',
  category: category_other_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: '7° Congresso Saúde Terapia Quântica',
  description: 'some series description',
  category: category_other_events,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Series.create!(
  name: 'Palestra avulsa 1',
  description: 'some series description',
  category: category_talks,
  image_url: 'http://lorempixel.com/573/322/nature'
)

Video.create!(
  name: 'Palestra 1 Evento',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  series: event1
)

Video.create!(
  name: 'Palestra 1 Evento',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  series: event2a
)

Video.create!(
  name: 'Palestra 1 Evento',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  series: event2a
)

Video.create!(
  name: 'Palestra 1 Evento',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  series: event2a
)

Video.create!(
  name: 'Palestra 1 Evento',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  series: event2a,
  category: category_events
)

Video.create!(
  name: 'Palestra 1 Avulsa',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  category: category_talks
)

Video.create!(
  name: 'Palestra 2 Avulsa',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  category: category_talks
)

Video.create!(
  name: 'Palestra 3 Avulsa',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  category: category_talks
)

Video.create!(
  name: 'Palestra 4 Avulsa',
  description: 'Amig Goswami é uma das maiores autoridades mundiais em'\
  ' Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a'\
  ' Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  information: 'Palestrante: Amit Goswami
  Tema da Palestra: Psicologia Quântica Integrativa
  Local: Palácio dos Festivais - Gramado
  Evento: Conferência Internacional de Saúde Quântica',
  synopsys: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia'\
  ' Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia'\
  ' tradicional e a Quântica. Ele sua fala ele mostra que o modelo'\
  ' comportamental',
  bio: 'Ph.D em Física Quântica, Amit Goswami ficou mundialmente famoso pela'\
  ' sua participação no filme "Quem somos nós?". Com diversos livros'\
  ' publicados e vários artigos científicos, o trabalho de Amit traz',
  vimeo_id: '163721649',
  image_url: 'http://lorempixel.com/573/322/nature',
  category: category_talks
)
