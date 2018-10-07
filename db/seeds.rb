#Branches

military_branches = ["Air Force", 
  "Air Force Reserve", 
  "Air National Guard",
  "Army",
  "Army Reserve",
  "Army National Guard",
  "Coast Guard",
  "Coast Guard Reserve",
  "Marine Corps",
  "Marine Corps Reserve",
  "Navy",
  "Navy Reserve"
]

military_branches.each {|branch| Branch.find_or_create_by(name: branch)}