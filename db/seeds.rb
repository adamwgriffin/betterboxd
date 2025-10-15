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
  # Avoid creating duplicates when re-running this file
  next if user.following.present?

  # Each user follows 2-4 random other users
  potential_follows = users - [ user ] # Exclude self
  follow_targets = potential_follows.sample(rand(2..4))

  follow_targets.each do |target|
    if user.follow(target)
      follow_count += 1
    end
  end
end

puts "\nCreating movies..."

sample_movies = [
  {
    title: "Star Wars",
    release_date: Date.parse("1977-05-25"),
    tagline: "A long time ago in a galaxy far, far away...",
    overview: "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
    poster_path: "6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg"
  },
  {
    title: "The Empire Strikes Back",
    release_date: Date.parse("1980-05-20"),
    tagline: "The Star Wars saga continues.",
    overview: "The epic saga continues as Luke Skywalker, in hopes of defeating the evil Galactic Empire, learns the ways of the Jedi from aging master Yoda. But Darth Vader is more determined than ever to capture Luke. Meanwhile, rebel leader Princess Leia, cocky Han Solo, Chewbacca, and droids C-3PO and R2-D2 are thrown into various stages of capture, betrayal and despair.",
    poster_path: "nNAeTmF4CtdSgMDplXTDPOpYzsX.jpg"
  },
  {
    title: "Pulp Fiction",
    release_date: Date.parse("1994-10-14"),
    tagline: "From the creator of 'True Romance' & 'Reservoir Dogs'",
    overview: "A burger-loving hit man, his philosophical partner, a drug-addled gangster's moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.",
    poster_path: "vQWk5YBFWF4bZaofAbv0tShwBvQ.jpg"
  },
  {
    title: "Mad Max: Fury Road",
    release_date: Date.parse("2015-05-13"),
    tagline: "The future belongs to the mad.",
    overview: "An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order.",
    poster_path: "tRxkZboyyXnFgCthoViWBwISZ0r.jpg"
  },
  {
    title: "Spirited Away",
    release_date: Date.parse("2001-07-20"),
    tagline: "Welcome to a world where anything is possible.",
    overview: "A young girl, Chihiro, becomes trapped in a strange new world of spirits. When her parents undergo a mysterious transformation, she must call upon the courage she never knew she had to free her family.",
    poster_path: "39wmItIWsg5sZMyRUHLkWBcuVCM.jpg"
  },
  {
    title: "The Matrix",
    release_date: Date.parse("1999-03-31"),
    tagline: "Believe the unbelievable.",
    overview: "Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.",
    poster_path: "p96dm7sCMn4VYAStA6siNz30G1r.jpg"
  },
  {
    title: "The Shawshank Redemption",
    release_date: Date.parse("1994-09-23"),
    tagline: "Fear can hold you prisoner. Hope can set you free.",
    overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency."
  },
  {
    title: "The Godfather",
    release_date: Date.parse("1972-03-24"),
    tagline: "An offer you can't refuse.",
    overview: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."
  },
  {
    title: "The Dark Knight",
    release_date: Date.parse("2008-07-18"),
    tagline: "Why so serious?",
    overview: "Batman raises the stakes in his war on crime with the help of Lt. Jim Gordon and DA Harvey Dent."
  },
  {
    title: "Forrest Gump",
    release_date: Date.parse("1994-07-06"),
    tagline: "Life is like a box of chocolates.",
    overview: "The presidencies of Kennedy and Johnson through the eyes of an Alabama man with an IQ of 75."
  },
  {
    title: "Inception",
    release_date: Date.parse("2010-07-16"),
    tagline: "Your mind is the scene of the crime.",
    overview: "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea."
  },
  {
    title: "Goodfellas",
    release_date: Date.parse("1990-09-21"),
    tagline: "Three decades of life in the Mafia.",
    overview: "The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners."
  },
  {
    title: "Parasite",
    release_date: Date.parse("2019-05-30"),
    tagline: "You know what kind of plan never fails? No plan.",
    overview: "A poor family schemes to become employed by a wealthy family and infiltrate their household by posing as unrelated, highly qualified individuals."
  }
]

sample_movies.each do |movie_data|
  Movie.find_or_create_by!(title: movie_data[:title]) do |m|
    m.release_date = movie_data[:release_date]
    m.tagline = movie_data[:tagline]
    m.overview = movie_data[:overview]
    m.poster_path = movie_data[:poster_path]
  end
end

puts "\nCreating reviews for movies with posters..."

# Sample review content for different types of movies
review_templates = [
  "An absolute masterpiece! This film changed cinema forever and continues to inspire new generations of filmmakers.",
  "Incredible storytelling with stunning visuals. A few minor pacing issues, but overall an exceptional experience.",
  "Pure cinematic poetry. Every frame is crafted with care and the emotional impact is profound.",
  "Brilliant direction and performances. This one will stick with you long after the credits roll.",
  "Solid film with great moments, though it doesn't quite reach the heights of perfection. Still worth watching.",
  "A genre-defining classic that set the standard for everything that followed. Timeless and essential viewing.",
  "Expertly crafted with incredible attention to detail. The world-building is second to none.",
  "Transcendent filmmaking that operates on multiple levels. A true work of art disguised as entertainment."
]

movies_with_posters = Movie.where.not(poster_path: nil)
review_count = 0

movies_with_posters.each do |movie|
  reviewers = users.sample(rand(3..6))

  reviewers.each do |user|
    # Avoid duplicate reviews when re-running seeds
    next if Review.exists?(user: user, movie: movie)

    random_date = rand(2.years.ago..Time.current)

    Review.find_or_create_by!(
      user: user,
      movie: movie,
      body: review_templates.sample,
      date_watched: random_date
    )

    review_count += 1
  end
end

puts "\n🎬 Development seed complete!"
puts "Created #{User.count} users with #{follow_count} follow relationships, #{Movie.count} movies, and #{review_count} reviews"
