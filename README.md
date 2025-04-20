# My Bundesliga

Many existing football apps tend to be overly complicated, often overwhelming users with distracting information such as blogs, transfer news, and teams that may not be relevant to them.
The goal is to develop a streamlined football app specifically focused on the League. This app will provide users with essential statistics for teams and players, upcoming matches, and an up-to-date League table.By prioritizing relevant and concise information, the app will enhance the user experience for Bundesliga fans and provide a offline view for their favorite team.

### Requirements

#### User Stories

- As a user, I want to see an overview of the League table so that I am always up to date with the current standing
- As a user, I want to see upcoming matches so that i always know, when important matches are played
- As a user, I want to get player informations so that i know how well players are performing
- As a user, I want to get team informations so that i know how well teams are performing
- As a user, I want to see the statistics of my favorite club even without a internet connection, so that i can always stay up to date

#### Glossary (Abbott's Technique)

| Term      | Definition                                                                                                                   |
| :-------- | :--------------------------------------------------------------------------------------------------------------------------- |
| League    | Contains general information about the German Bundesliga, like the league format, and the season duration.                   |
| Season    | Contains all the Match Days from a single year of play, along with the start and end dates.                                  |
| Match     | Holds the statistics of one play, including the two competing teams.                                                         |
| Match Day | Represents one match round, where every Team plays one Match, there are 34 match rounds in total                             |
| Team      | Represents one of the 18 teams in the German Bundesliga, can be marked as a favorite.                                        |
| Player    | Represents one player in a team, including metrics like his personal information, his role in the team, and his performance. |

#### Analysis Object Model

![AOM Diagram](./uml.png)

### Architecture

#### Top-Level Architecture

![TLA](./tla.png)

#### Subsystem Decomposition

![SSD Diagram](./ssd.png)
