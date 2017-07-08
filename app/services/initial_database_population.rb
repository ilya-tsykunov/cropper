module InitialDatabasePopulation
  extend self

  def perform
    create_users
    create_topics
    create_events
  end

  private

  def create_users
    User.create!(
      name: 'cropper',
      email: 'cropper@crop.per',
      send_notifications: true,
      password: 'cropper',
      password_confirmation: 'cropper'
    )
  end

  def create_topics
    Topic.create!(name: 'Organization')
    Topic.create!(name: 'Advertisement')
    Topic.create!(name: 'Celebrities')
  end

  def create_events
    Event.create!(
      name: 'New Year',
      start_date: DateTime.new(2016, 1, 1, 0, 0),
      end_date: DateTime.new(2016, 1, 2, 0, 0),
      city: 'Moscow',
      topics: [Topic.find_by(name: 'Organization')]
    )
    Event.create!(
      name: 'Easter',
      start_date: DateTime.new(2017, 2, 10, 0, 0),
      end_date: DateTime.new(2017, 3, 10, 0, 0),
      city: 'Moscow',
      topics: [Topic.find_by(name: 'Organization'), Topic.find_by(name: 'Celebrities')]
    )
    Event.create!(
      name: 'Fathers day',
      start_date: DateTime.new(2017, 5, 15, 12, 15),
      end_date: DateTime.new(2017, 5, 15, 12, 45),
      city: 'London',
      topics: [
        Topic.find_by(name: 'Organization'),
        Topic.find_by(name: 'Celebrities'),
        Topic.create!(name: 'Advertisement')
      ]
    )
  end
end
