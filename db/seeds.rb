# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Deal.destroy_all
deals_attributes = [
  {
    description: "Exclusivité - Occupé par un homme de 70 ans et une femme de 82 ans, avec une rente de 417 €.",
    address: "Vaires sur Marne - Quartier Ouest",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/0/j/e/i/0jeindt0eb8v94r1uhhsekf7nqmhez6x9zuwvel84.jpg',
    occupancy: "Viager occupé (F 82 ans- H 70 ans)",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3

  },
  {
    description: "Exclusivité - Occupé par un homme de 70 ans, avec une rente de 569 €/mois.",
    address: "Meulan - Quartier Annonciades",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/m/h/h/1mhhtatk71rc030odvmmhumbcjwlx1jg5f3lxxipg.jpg',
    occupancy: "Viager occupé (H 70 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Exclusivité - Occupé par une femme de 86 ans, avec une rente de 1168 €/mois.",
    address: "Fontenay Aux Roses - Quartier Ormeaux",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/2/1/w/r/21wrhi8w8bf9kvwngkhlsc1ubk49tkgsmtu47xlh0.jpg',
    occupancy: "Viager occupé (F 86 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Exclusivité - Occupé par une femme de 76 ans, avec une rente de 654 €/mois.",
    address: "L'Hay les Roses - Quartier Centre",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/z/w/k/1zwk9fuzpxwaibuvvgk6d5e3mbh43sxtxyqonl4ok.jpg',
    occupancy: "Viager occupé (F 76 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Exclusivité - Viager libre, avec une rente de 706 €/mois.",
    address: "Paris 18ème - Quartier Clignancourt-Jules Joffrin",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/e/3/9/1e39usdkg1gkt4xn22glc8gpgc77qmffcwz7zpqlw.jpg',
    occupancy: "Viager libre (H 70 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Exclusivité - Occupé par une femme de 81 ans, avec une rente de 1365 €/mois.",
    address: "Montreuil - Quartier La Noue-Clos Français",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/2/2/6/o/226os6iouk3yjx9mgg9ec398mv11bse46aesmxiic.jpg',
    occupancy: "Viager occupé (F 81 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Exclusivité - Occupé par un homme de 89 ans et une femme de 79 ans, avec une rente de 1300€/mois.",
    address: "Paris 12ème - Métro Ledru-Rollin/Gare de Lyon",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/f/k/s/1fks7yjl8htmxetz4bwwkd8ms7ivd6x1hy7r2ak1g.jpg',
    occupancy: "Viager occupé (F 79 ans - H 89 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Exclusivité - Occupé par un homme de 92 ans et une femme de 79 ans, avec une rente de 1159 €/mois.",
    address: "Beynes - Quartier Le Bourg et le Hameaux",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/b/m/v/1bmv2tl7fenqqpc7nsr0t94ovw7pkzdutxnxo1iwk.jpg',
    occupancy: "Viager occupé (F 79 ans- H 92 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Exclusivité - Occupé par une femme de 87 ans, avec une rente de 1475 €/mois.",
    address: "Epinay sur Seine - Quartier Les Mobiles-Maison de Santé",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/w/i/j/1wij2sf6p7t3mmmy0fdjakwes5i2mq0g2o6va0ohg.jpg',
    occupancy: "Viager occupé (F 87 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Exclusivité - Occupé par une femme de 78 ans, avec une rente de 692 €/mois.",
    address: "Puteaux - Quartier Colline",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/2/9/k/p/29kpd3pjlvs61pg28g2xygns61lxwfaccs8mq73zo.jpg',
    occupancy: "Viager occupé (F 78 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  }
]
deals_attributes.each { |params| Deal.create!(params) }

