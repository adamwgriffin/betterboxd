puts "Creating sample users..."

sample_users = [
  {
    username: "alice_cooper",
    first_name: "Alice",
    last_name: "Cooper",
    email_address: "alice@example.com",
    location: "New York, NY",
    website: "https://alicecooper.com",
    bio: "Film enthusiast and indie movie lover. Always looking for hidden gems and underrated classics."
  },
  {
    username: "movie_mike",
    first_name: "Mike",
    last_name: "Johnson",
    email_address: "mike@example.com",
    location: "Los Angeles, CA",
    bio: "Aspiring filmmaker and movie critic. Love everything from blockbusters to art house films."
  },
  {
    username: "sarah_cinephile",
    first_name: "Sarah",
    last_name: "Williams",
    email_address: "sarah@example.com",
    location: "Chicago, IL",
    website: "https://sarahwatches.blog",
    bio: "Documentary enthusiast. Fascinated by stories that change the world."
  },
  {
    username: "retro_reviewer",
    first_name: "David",
    last_name: "Brown",
    email_address: "david@example.com",
    location: "Austin, TX",
    bio: "Obsessed with 80s and 90s cinema. If it's got practical effects, I'm interested."
  },
  {
    username: "horror_hound",
    first_name: "Emma",
    last_name: "Davis",
    email_address: "emma@example.com",
    location: "Portland, OR",
    bio: "Horror movie aficionado. The scarier, the better! 🎃"
  },
  {
    username: "comedy_central",
    first_name: "Josh",
    last_name: "Miller",
    email_address: "josh@example.com",
    location: "Boston, MA",
    website: "https://funnyfilms.net",
    bio: "Life's too short for bad comedies. Here for the laughs and good times."
  },
  {
    username: "world_cinema",
    first_name: "Priya",
    last_name: "Patel",
    email_address: "priya@example.com",
    location: "San Francisco, CA",
    bio: "International film lover. Subtitles don't scare me!"
  },
  {
    username: "classic_fan",
    first_name: "Robert",
    last_name: "Taylor",
    email_address: "robert@example.com",
    location: "Denver, CO",
    bio: "Golden Age of Hollywood enthusiast. They don't make them like they used to."
  }
]

sample_users.each do |user_data|
  User.find_or_create_by!(username: user_data[:username]) do |u|
    u.first_name = user_data[:first_name]
    u.last_name = user_data[:last_name]
    u.email_address = user_data[:email_address]
    u.location = user_data[:location]
    u.website = user_data[:website]
    u.bio = user_data[:bio]
    u.password = "password123"
  end
end

puts "\nCreating follow relationships..."

users = User.all.to_a
follow_count = 0

users.each do |user|
  # Each user follows 2-4 random other users
  potential_follows = users - [ user ] # Exclude self
  follow_targets = potential_follows.sample(rand(2..4))

  follow_targets.each do |target|
    if user.follow(target)
      follow_count += 1
    end
  end
end

puts "\n🎬 Development seed complete!"
puts "Created #{User.count} users with #{follow_count} follow relationships"
