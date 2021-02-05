# Views:

## Dwellers
### Dwellers/signup
- user enters all info except their house
  - upon successful signup they are routed to their ind show page: dwellers/show

###Dwellers/show.erb
- Ind show page shows info they included and has links to add a house to their account, add plants, or link to edit their account page

### Dwellers/edit/:id
- displays the signup page and allows edits

<br />

## Homes
### Homes/index
- if user is logged in, they can see all homes w/ link to home/show/:id page + first 5 plants in home from this page



### Homes/show/:id
- if user is logged in and belongs to this house they can see their house info including:
  - home details
  - other people they live with
  - all plants in home with link to each plant/show/:id
  - chart of plant care:

<br />

## Plants

### Plant/index
- if user is logged in, shows all plants (common name) entered so far website with link to ind plant site with more info

### Plants/show/:id
- lists all plant info except owner or home
