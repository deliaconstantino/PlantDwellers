# PlantDwellers App
### An app for people who live together to share in the care of their houseplants

### __Models:__

### _House_
- has many plants
- has many dwellers/users/people who live there (could have just one, but possibility for multiple)
- has many rooms/spaces - _stretch goal_
- has a temporate zone

### _Plant_
- belongs to a house
- lives in a certain room - _stretch goal_
- belongs to a dweller who grew or purchased it
- has many caretakes/users through it's house
- has particular qualities
  - need for sun/shade
  - how often to water - create a chart that any caretaker can check off so it does not get over-watered
  - when/how to fertilize/plant food
  - exciting life cycle events--flowering, harvesting, pinching off herb flowers to encourage growth
  - when to rotate if indoors for even growth
  - has a common name
  - has a scientific name
  - has a size
  - has a category (tree, cactus, general houseplant, veggie, herb, lettuces/greens)
  - has a use (food, ambiance, fresh air, etc)

### _Dweller_
- belongs to a house
- has many (or one or none) roommates through their house
- has many (or just one) favorite plant(s)
- has many plants he/she purchased or grew
- has a list of plants they'd like to grow/purchase


### __Stretch Goals:__
- add a Room class so that a house has many rooms/each room belongs to a house & a room has many plants/each plant belongs to a room
- create a Guest class so a dweller can invite a plant-sitter to access their plant info in order to care for their plants when they are on vacation, etc
