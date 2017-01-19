# First we'll need a class to represent the solar system. Let's call it System.
class System

  # Let's make bodies read-only.
  attr_reader :bodies

  # give it an attribute bodies. bodies will start as an empty array (ie. []).
  def initialize
    @bodies = []
  end

  # give System an instance method called add which will add a celestial body to the list.
  def add(body)
    @bodies << body
  end

  # We'll also need an instance method called total_mass which should add up the mass of all the bodies in bodies, and return it.
  def total_mass
    total_mass = 0
    @bodies.each do |body|
      total_mass += body.mass
    end
    total_mass
  end

  def display_bodies
    @bodies.each do |body|
      puts body.name
    end
  end

  def num_bodies
    "Number of bodies #{Body.num_bodies}"
  end

  # def num_bodies2
  #   @bodies.length
  # end
end

# We'll also need a class to represent the various celestial bodies. We'll call it Body. Each of them will need a name and a mass. Let's make these read-only; we'll assign them when we create the body.
class Body
  attr_reader :name, :mass
  @@num_bodies = 0

  def initialize(name, mass)
    @name = name
    @mass = mass
    @@num_bodies += 1
  end

  def self.num_bodies # Class READER
    @@num_bodies
  end
end

# There are several types of bodies we're concerned about in our solar system: planets, stars (like our sun), and moons. We'll ignore asteroids and smaller planetoids (sorry Pluto).
# Each of our body types needs a class: Planet, Star, and Moon. All of these bodies have some similarities: they all have a name and a mass. So, let's also make them inherit from Body. They do have some unique qualities though.
class Planet < Body
  # Have a day, which is the number of hours it takes for the planet to rotate all the way around once.
  # Have a year, which is the number of days it takes for the planet to orbit the sun once. Whether you want to express this in Earth days or the planet's days is up to you.
  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
  end

end

class Star < Body
  # Have a type (ie. our Sun is a G-type star)
  def initialize(name, mass,type)
    super(name, mass)
    @type = type
  end
end

class Moon < Body
  # Have a month, which is the number of days it takes for the moon to orbit its planet. Again, this can either be Earth days or the planet's days, your choice.
  # Have a planet that they orbit. We want to store the whole Planet object here.
  def initialize(name, mass, month, orbit_planet)
    super(name, mass)
    @month = month
    @orbit_planet = orbit_planet
  end
end

earth = Planet.new("Earth", 50 , 24, 365)
sun = Star.new("Sun", 100, "G-type")
moon = Moon.new("Moon", 20, 30, "Earth")

solar_system = System.new
solar_system.add(earth)
solar_system.add(sun)
solar_system.add(moon)
#puts solar_system.bodies
puts solar_system.total_mass
solar_system.display_bodies
puts solar_system.num_bodies
#puts solar_system.num_bodies2
