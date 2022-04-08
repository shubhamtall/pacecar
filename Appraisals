# frozen_string_literal: true

rails_versions = ['6.1.4']
database_drivers = %w[mysql2 pg sqlite3]

rails_versions.each do |rails|
  database_drivers.each do |database|
    appraise "rails_#{rails}_#{database}_driver" do
      gem 'rails', "~> #{rails}"
      gem database
    end
  end
end
