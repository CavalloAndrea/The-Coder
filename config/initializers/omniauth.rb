OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '184380285726484', 'f7847aa8d3b0fe27ff76193b745f7f26',
        :display => 'popup',
        :scope => 'email',
        :info_fields => 'name,email'
end