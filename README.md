# Your Next Trip                                    (Dec 2019)

### [Link to presentation](https://docs.google.com/presentation/d/1UH0o9J3HOZRnxs_dW0RC5--5BVPMB5m80RGqIr1X_xw/edit?usp=sharing)

This project was an assignment to the team to produce a small website.  We chose to implement a system that called a geocoder
api to turn street addresses into longitude and latitude. These results are then used in the haversine formula to calculate
a great circle route distance on the globe. Given the results, recommendations on how to travel were made.

The presentation is included as background information on how the team approached, designed, implemented and tested the project.  
Processes, tools and people are discussed.

## How to run this project
This project is packaged as an Eclipse web project, including Eclipse project configuration files.
To run the project, use Tomcat v9 in Eclipse.

### API keys
For the project to run, an Algolia Places API key must be provided. To do this, create a free account at https://www.algolia.com/users/sign_up/places
Place the project ID, **in quotes**, in a file named `algolia-app-id`, and the Search API key, **in quotes**, in a file named `algolia-api-key`.
Both files must be placed in the `WebContent` folder.
