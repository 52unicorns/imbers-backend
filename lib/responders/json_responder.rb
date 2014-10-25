# rubocop:disable MethodLength
# TODO(vesln): meh, but well... :)
module Responders
  module JsonResponder
    def api_behavior(error)
      options[:location] = options.fetch(:location, nil)

      if put? || patch?
        display resource, status: :ok
      else
        super
      end
    end

    def json_resource_errors
      locale = I18n.locale
      errors = []
      namespace = resource.class.model_name.plural
      resource.errors.each_with_index do |err, index|
        errors[index] = {
          namespace: namespace,
          subject: err[0],
          message: resource.errors.full_message(err[0], err[1])
        }
      end

      I18n.locale = 'json'
      resource.invalid?
      resource.errors.each_with_index do |error, index|
        errors[index][:id] = "#{namespace}.#{errors[index][:subject]}.#{error[1]}"
        errors[index][:type] = error[1]
      end
      I18n.locale = locale
      { errors: errors }
    end
  end
end
# rubocop:enable MethodLength
