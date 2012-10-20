BadgesEngine::Configuration.setup do |config|
  config.issuer = {
    :origin => 'http://badges.matehackers.com',
    :name => 'Courses',
    :org => 'Matehackers',
    :contact => 'courses@matehackers.org'
  }

  config.baker_url = 'http://beta.openbadges.org/baker'
  config.badge_version = '0.5.0'
  config.user_class = User
  config.salt = 'poopbadges'
end
