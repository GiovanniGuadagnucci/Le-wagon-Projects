water = List.create(name: "Water")
fire = List.create(name: "Fire")
grass = List.create(name: "Grass")

water.photo.image = "https://res.cloudinary.com/giovannig/image/upload/v1629470699/giogio-heroku-app/94310bf0f7c0b335470b219740238edb_nsu0uk.jpg"
fire.photo.image = "https://res.cloudinary.com/giovannig/image/upload/v1629473334/giogio-heroku-app/29af57eb45ee75913f1a7e06c7e87a2e_zhpdfa.jpg"
grass.photo.image = "https://res.cloudinary.com/giovannig/image/upload/v1629470830/giogio-heroku-app/3afe9bd490cb85b53c6853d683836239_zh5pdd.jpg"

water.save
fire.save
grass.save
