class HomeController < ApplicationController

    def index
        @assertions = BadgesEngine::Assertion.all

        respond_to do |format|
          format.html # index.html.erb
        end
    end

    # Takes a badge and awards it to a bunch of users
    # The users are given as email addresses, and are created if they don't exist yet
    def award
        @badge = BadgesEngine::Badge.find(params[:badge_id])

        emails = params[:emails].split(/[;,]/)
        assertions = []
        errors = false

        emails.each do |email|
            ass = BadgesEngine::Assertion.new(:evidence => params[:evidence],
                :expires => Date.today + 3.year, :issued_on => Date.today)

            ass.user = User.find_or_create_by_email(email)
            ass.badge = @badge

            assertions << ass

            if not ass.save
                errors = true
            end
        end

        if errors
            redirect_to issue_path, :notice => 'Double check the info dude'
        else
            assertions.each { |ass| BadgeMailer.delay.badge_email(ass) }
            redirect_to issue_path, :notice => 'Done, users registered'
        end

    end

    def issue
        @badges = BadgesEngine::Badge.all.map { |b| [b.name, b.id] }

        respond_to do |format|
            format.html
        end
    end
end
