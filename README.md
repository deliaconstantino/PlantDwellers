# PlantDwellers
A Sinatra app to help people care for their houseplants.

# About
I have a tendency to over or underwater plants, a tendency which gets worse when living with others and sharing the care of houseplants. This app is intended for roommates, partners, or others who live together to care for their houseplants. This app allows people to track the watering, rotation, and fertilization needs of their various plants.

## Installation

- Fork the repository
- Clone the files to your computer
- Run bundle install
- Run rake db:migrate
- Run shotgun to start the server

### Enable Sessions

To enable sessions for a more secure expereince, create a `.env` file in the root directory.

In `.env` add the following session secret, replacing the string ABC123 with a secret word or string.

`SESSION_SECRET="ABC123"`

Commit `.gitignore`

Please note: The `.env` file includes sensitive information; it should not be tracked, committed or push to Github.

### Use

PlantDwellers is now ready to use. Enter your information or seed the database with the command `rake db:seed` to pre-populate with information.


### Additional
[]
[License] (LICENSE)
[Spec] (Spec.md)
