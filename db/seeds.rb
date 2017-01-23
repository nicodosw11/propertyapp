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
    description: "Occupé par un homme de 70 ans et une femme de 82 ans, avec une rente de 417 €.",
    address: "Vaires sur Marne - Quartier Ouest",
    kind: "Appartement 3 pièces 68m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/0/j/e/i/0jeindt0eb8v94r1uhhsekf7nqmhez6x9zuwvel84.jpg',
    occupancy: "Viager occupé (F 82 ans- H 70 ans)",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3

  },
  {
    description: "Occupé par un homme de 70 ans, avec une rente de 569 €/mois.",
    address: "Meulan - Quartier Annonciades",
    kind: "Maison 4 pièces 108m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/m/h/h/1mhhtatk71rc030odvmmhumbcjwlx1jg5f3lxxipg.jpg',
    occupancy: "Viager occupé (H 70 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Occupé par une femme de 74 ans, avec une rente de 751 €/mois.",
    address: "Nogent sur Marne - Quartier Nogent Village-Centre Ville",
    kind: "Appartement 2 pièces 44m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/v/m/i/1vmizu63mohh4v90aym18ybhjhbz8kj2l3qju3n5g.jpg',
    occupancy: "Viager occupé (F 74 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Occupé par un homme de 83 ans et une femme de 84 ans, avec une rente de 1775 €/mois.",
    address: "Verrieres le Buisson - Quartier Bois de Verrieres-Vaupereux",
    kind: "Maison 4 pièces 80m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/0/b/8/a/0b8atnyrodeq78asg9ojv467hhw9ga7wo705qov78.jpg',
    occupancy: "Viager occupé (F 84 ans- H 83 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Viager libre, avec une rente de 706 €/mois.",
    address: "Paris 18ème - Quartier Clignancourt-Jules Joffrin",
    kind: "Appartement 2 pièces 22m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/e/3/9/1e39usdkg1gkt4xn22glc8gpgc77qmffcwz7zpqlw.jpg',
    occupancy: "Viager libre (H 70 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Occupé par une femme de 81 ans, avec une rente de 1365 €/mois.",
    address: "Montreuil - Quartier La Noue-Clos Français",
    kind: "Appartement 3 pièces 70m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/2/2/6/o/226os6iouk3yjx9mgg9ec398mv11bse46aesmxiic.jpg',
    occupancy: "Viager occupé (F 81 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Occupé par un homme de 90 ans et une femme de 79 ans, avec une rente de 1300€/mois.",
    address: "Paris 12ème - Métro Ledru-Rollin/Gare de Lyon",
    kind: "Appartement 2 pièces 45m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/f/k/s/1fks7yjl8htmxetz4bwwkd8ms7ivd6x1hy7r2ak1g.jpg',
    occupancy: "Viager occupé (F 79 ans - H 90 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Occupé par un homme de 92 ans et une femme de 79 ans, avec une rente de 1159 €/mois.",
    address: "Beynes - Quartier Le Bourg et le Hameaux",
    kind: "Maison 5 pièces 103m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/1/b/m/v/1bmv2tl7fenqqpc7nsr0t94ovw7pkzdutxnxo1iwk.jpg',
    occupancy: "Viager occupé (F 79 ans- H 92 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Occupé par une femme de 85 ans, avec une rente de 888 €/mois.",
    address: "Bourg la Reine - Quartier Le Clos du Luxembourg-Centre Ville",
    kind: "Appartement 3 pièces 75m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/0/1/f/0/01f0ks8by5foa9qdxavwu3r8j8yf9h4x7jou8iz1w.jpg',
    occupancy: "Viager occupé (F 85 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
  {
    description: "Occupé par une femme de 78 ans, avec une rente de 692 €/mois.",
    address: "Puteaux - Quartier Colline",
    kind: "Appartement 2 pièces 54m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/2/9/k/p/29kpd3pjlvs61pg28g2xygns61lxwfaccs8mq73zo.jpg',
    occupancy: "Viager occupé (F 78 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
    {
    description: "Occupé par un homme de 79 ans, avec une rente de 650 €/mois.",
    address: "Paris 3ème - Rue Michel le Compte",
    kind: "Appartement 3 pièces 90m²",
    image_url: 'http://v.seloger.com/s/width/800/visuels/0/a/v/9/0av94ad6pteg0a4rvtfhjq6fmkoa7jvn2in7iwops.jpg',
    occupancy: "Viager occupé (H 79 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  },
    {
    description: "Occupé par une femme de 84 ans, avec une rente de 1600 €/mois.",
    address: "Paris 12ème - Métro Ledru-Rollin/Gare de Lyon",
    kind: "Appartement 2 pièces 48m²",
    image_url: 'http://v.seloger.com/s/cdn/x/visuels/0/k/n/0/0kn0bz26r10dtwj9sqp9116hljng73l6wnfr7yl10.jpg',
    occupancy: "Viager occupé (F 84 ans).",
    valuation: 1,
    funded: 0,
    current_investors: 0,
    yield: 1.97,
    timeline: 3
  }
]
deals_attributes.each { |params| Deal.create!(params) }

