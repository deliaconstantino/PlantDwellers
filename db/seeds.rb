
florida = Home.create(nickname: "Palm Paradise", hardiness_zone: 9, city: "Tampa, FL")
ohio = Home.create(nickname: "Midwestern Retreat", hardiness_zone: 6, city: "Columbus, OH")
chicago = Home.create(nickname: "Chitown Vibes", hardiness_zone: 5, city: "Chicago, IL")

sam = Dweller.create(name: "Sam",  email: "sam@example.com", username: "sam123", password: "thispass", favorite_plant: "basil", home_id: chicago.id)
kyle = Dweller.create(name: "Kyle",  email: "kyle@example.com", username: "kyle123", password: "kylepass", favorite_plant: "aloe", home_id: chicago.id)
delia = Dweller.create(name: "Delia",  email: "delia@example.com", username: "delia7", password: "12de89", favorite_plant: "bromeliad", home_id: florida.id)
scott = Dweller.create(name: "Scott",  email: "scott@example.com", username: "scottie1", password: "plantspass", favorite_plant: "palm tree", home_id: florida.id)
clare = Dweller.create(name: "Clare",  email: "cc@example.com", username: "51clare", password: "cpass12", favorite_plant: "tulip", home_id: ohio.id)
caroline = Dweller.create(name: "caroline",  email: "carrie@example.com", username: "care12", password: "carepass", favorite_plant: "christmas cactus", home_id: ohio.id)


basil = Plant.create(common_name: "basil", scientific_name: "Ocimum basilicum", watering_schedule: {"value" => "3", "frequency" => "week"}, rotation_schedule: {"value" => "3", "frequency" => "month"}, fertilization_schedule: {"value" => "3", "frequency" => "season"}, location: "porch", size: "small", category: "herb", dweller_id: caroline.id)
palm_tree = Plant.create(common_name: "palm tree", scientific_name: "Arecaceae", watering_schedule: {"value" => "2", "frequency" => "month"}, rotation_schedule: {"value" => "3", "frequency" => "month"}, fertilization_schedule: {"value" => "1", "frequency" => "season"}, location: "porch", size: "large", category: "tree", dweller_id: scott.id)
bromeliad = Plant.create(common_name: "bromeliad", scientific_name: "bromeliad", watering_schedule: {"value" => "2", "frequency" => "week"}, rotation_schedule: {"value" => "3", "frequency" => "month"}, fertilization_schedule: {"value" => "1", "frequency" => "season"}, location: "living room", size: "medium", category: "flower", dweller_id: kyle.id)
powder_puff = Plant.create(common_name: "powder puff", scientific_name: "Mammillaria bocasana", watering_schedule: {"value" => "2", "frequency" => "month"}, rotation_schedule: {"value" => "1", "frequency" => "season"}, fertilization_schedule: {"value" => "1", "frequency" => "season"}, location: "living room", size: "small", category: "succulent", dweller_id: delia.id)
air_plant = Plant.create(common_name: "air plant", scientific_name: "Tillandsia", watering_schedule: {"value" => "1", "frequency" => "week"}, rotation_schedule: {"value" => "1", "frequency" => "season"}, fertilization_schedule: {"value" => "1", "frequency" => "season"}, location: "bathroom", size: "small", category: "flower", dweller_id: sam.id)
oregano = Plant.create(common_name: "oregano", scientific_name: "Origanum vulgare", watering_schedule: {"value" => "3", "frequency" => "week"}, rotation_schedule: {"value" => "3", "frequency" => "month"}, fertilization_schedule: {"value" => "1", "frequency" => "season"}, location: "porch", size: "small", category: "herb", dweller_id: caroline.id)
orchid = Plant.create(common_name: "orchid", scientific_name: "Orchidaceae", watering_schedule: {"value" => "1", "frequency" => "month"}, rotation_schedule: {"value" => "1", "frequency" => "season"}, fertilization_schedule: {"value" => "1", "frequency" => "season"}, location: "bedroom", size: "medium", category: "flower", dweller_id: clare.id)
