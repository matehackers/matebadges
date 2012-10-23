BadgesEngine::Configuration.setup do |config|
  config.issuer = {
    :origin => 'http://badges.matehackers.org',
    :name => 'Mate Courses',
    :org => 'Matehackers',
    :contact => 'courses@matehackers.org'
  }

  config.baker_url = 'http://beta.openbadges.org/baker'
  config.badge_version = '1.0'
  config.user_class = User
  config.salt = '0421008445828ceb46f496700a5fa65e'
end