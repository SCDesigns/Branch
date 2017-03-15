#Seed file to populate Branch feed. Seed with 'rake db:seed'
amway = User.create(username: "AmwayEvents", password: "GoMagic", email: "AmwayEvents@gmail.com")
amway.branches << Branch.create(event: "2017 NCAA DIV 1 Men's Basketball Championship", organization: "NCAA", date: "03.16 & 03.18, Times May Vary", location:"Amway Center - 400 W Church St #200, Orlando, FL 32801", info: "For Tickets & Game Times Visit - https://www.vividseats.com/ncaab/ncaa-tournament-orlando-tickets.html")
amway.branches << Branch.create(event: "Orlando Magic vs. Philadelphia 76ers", organization: "NBA", date: "Monday, March 20, 2017, 7:00 PM", location:"Amway Center - 400 W Church St #200, Orlando, FL 32801", info: "For Tickets & Game Times Visit - http://www.ticketmaster.com/Orlando-Magic-tickets/artist/805995")
amway.save

disney = User.create(username: "DisneyEvents", password: "Mickey", email: "MickeyTheMouse@disney.com")
disney.branches << Branch.create(event: "Mighty St. Patrick's Festival at Raglan Road Irish Pub and Restaurant", organization: "Disney - Disney Springs", date: "03.16 - 03.19, Times May Vary", location: "Raglan Road Irish Pub (Disney Springs) - 1640 E. Buena Vista Dr., Lake Buena Vista, Fla", info: "A round-the-clock lineup of talented musicians, award-winning Irish dancers and authentic cuisine by Irish celebrity chef and PBS/Create TV personality Kevin Dundon.")
disney.branches << Branch.create(event: "Star Wars Half Marathon - The Dark Side Weekend", organization: "Disney - ESPN Wide World of Sports", date: "April 20 - April 23", location: "ESPN Wide World of Sports - 700 S Victory Way, Kissimmee, FL 34747", info: "Races include the 5K, Kids' Races, 10K, and half marathon, with the Dark Side Challenge for those completing the 10K and half marathon distances. For More Info Visit - http://www.rundisney.com/")
disney.save
