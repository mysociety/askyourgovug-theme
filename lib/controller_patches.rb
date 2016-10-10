# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
  HelpController.class_eval do
    def downloads ; end

    private

    def catch_spam
      if request.post? && params[:contact]
        if !params[:contact][:comment].blank? || !params[:contact].key?(:comment)
          redirect_to frontpage_url
        end
      end
    end

  end
end
