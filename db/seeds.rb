# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Deal.destroy_all
Property.destroy_all

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

# properties = []

properties_attributes = [
  {
    genre: "Maison",
    surface: 103,
    nb_rooms: 5,
    nb_bedrooms: 3,
    city: "Beynes",
    district: "Quartier Le Bourg et le Hameaux",
    full_address: "Place du 8 Mai 1945, 78650 Beynes",
    deal_id: 8,
  },
  {
    genre: "Appartement",
    surface: 70,
    nb_rooms: 3,
    nb_bedrooms: 2,
    city: "Montreuil",
    district: "Quartier La Noue-Clos Français",
    full_address: "9 Rue Dombasle, 93100 Montreuil",
    deal_id: 6,
  },
  {
    genre: "Appartement",
    surface: 22,
    nb_rooms: 2,
    nb_bedrooms: 1,
    city: "Paris 18ème",
    district: "Quartier Clignancourt-Jules Joffrin",
    full_address: "1 Place Jules Joffrin, 75018 Paris",
    deal_id: 5,
  },
  {
    genre: "Appartement",
    surface: 75,
    nb_rooms: 3,
    nb_bedrooms: 2,
    city: "Bourg la Reine",
    district: "Quartier Le Clos du Luxembourg-Centre Ville",
    full_address: "6 Boulevard Carnot, 92340 Bourg-la-Reine",
    deal_id: 9,
  },
    {
    genre: "Appartement",
    surface: 44,
    nb_rooms: 2,
    nb_bedrooms: 1,
    city: "Nogent sur Marne",
    district: "Quartier Nogent Village-Centre Ville",
    full_address: "Place Roland Nungesser, 94130 Nogent-sur-Marne",
    deal_id: 3,
  },
    {
    genre: "Maison",
    surface: 108,
    nb_rooms: 4,
    nb_bedrooms: 3,
    city: "Meulan",
    district: "Quartier Annonciades",
    full_address: "10 Place Brigitte Gros, 78250 Meulan-en-Yvelines",
    deal_id: 2,
  },
  {
    genre: "Appartement",
    surface: 90,
    nb_rooms: 3,
    nb_bedrooms: 1,
    city: "Paris 3ème",
    district: "Rue Michel le Compte",
    full_address: "2 Rue Eugène Spuller, 75003 Paris",
    deal_id: 11,
  },
    {
    genre: "Appartement",
    surface: 68,
    nb_rooms: 3,
    nb_bedrooms: 4,
    city: "Vaires sur Marne",
    district: "Quartier Ouest",
    full_address: "26 Boulevard de Lorraine, 77360 Vaires-sur-Marne",
    deal_id: 1,
  },
    {
    genre: "Maison",
    surface: 80,
    nb_rooms: 4,
    nb_bedrooms: 3,
    city: "Verrieres le Buisson",
    district: "Quartier Bois de Verrieres-Vaupereux",
    full_address: "Place Charles de Gaulle, 91370 Verrières-le-Buisson",
    deal_id: 4,
  },
    {
    genre: "Appartement",
    surface: 48,
    nb_rooms: 2,
    nb_bedrooms: 1,
    city: "Paris 12ème",
    district: "Métro Ledru-Rollin/Gare de Lyon",
    full_address: "Place de l'Hôtel de Ville, 75004 Paris",
    deal_id: 12,
  },
    {
    genre: "Appartement",
    surface: 45,
    nb_rooms: 2,
    nb_bedrooms: 1,
    city: "Paris 12ème",
    district: "Métro Ledru-Rollin/Gare de Lyon",
    full_address: "130 Avenue Daumesnil, 75012 Paris",
    deal_id: 7,
  },
    {
    genre: "Appartement",
    surface: 54,
    nb_rooms: 2,
    nb_bedrooms: 1,
    city: "Puteaux",
    district: "Quartier Colline",
    full_address: "131 Rue de la République, 92800 Puteaux",
    deal_id: 10,
  }
]

# properties = %w(Appartement Maison Duplex Studio Penthouse)
# properties.each { |property| Property.create!(genre: property) }
properties_attributes.each { |params| Property.create!(params) }

User.destroy_all
Investment.destroy_all

users = [
  {
    first_name: 'Sam',
    last_name: 'Appleseed',
    password: 'apple1',
    email: 'sam.appleseed@gmail.com',
    country_of_residence: 'United Kingdom'
    },
  {
    first_name: 'Mike',
    last_name: 'Julien',
    password: 'tomato',
    email: 'mike.julien@gmail.com',
    country_of_residence: 'France'
    },
  {
    first_name: 'Alex',
    last_name: 'Patterson',
    password: 'chicken',
    email: 'alex.patterson@gmail.com',
    country_of_residence: 'France'
    },
  {
    first_name: 'Olivier',
    last_name: 'Smith',
    password: 'carotte',
    email: 'olivier.smith@gmail.com',
    country_of_residence: 'France'
    },
  {
    first_name: 'Samantha',
    last_name: 'Jones',
    password: 'courgette',
    email: 'samantha.jones@gmail.com',
    country_of_residence: 'France'
    }
]

users.each { |user| User.create!(user) }

# investments = %w(10 50 150 250 2500 5000 7500 10000 15000 30000)
# investments.each { |investment| Investment.create!(amount: investment) }

investments = [
  {
    description: 'initial deposit',
    amount: 10,
    deal_id: 1,
    user_id: 1
    },
  {
    description: 'first instalment',
    amount: 50,
    deal_id: 3,
    user_id: 4
    },
  {
    description: 'initial deposit',
    amount: 150,
    deal_id: 6,
    user_id: 2
    },
  {
    description: 'adjustment',
    amount: 250,
    deal_id: 4,
    user_id: 3
    },
  {
    description: 'second instalment',
    amount: 500,
    deal_id: 4,
    user_id: 2
    }
]
