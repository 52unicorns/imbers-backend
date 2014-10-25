module SpecSupport
  module RequestHelpers
    extend ActiveSupport::Concern

    included do
      let(:http_env) { { 'HTTP_ACCEPT' => 'application/json' } }

      def json
        hash = JSON.parse(response.body)
        recursive_symbolize_keys(hash)
      end

      def recursive_symbolize_keys(h)
        case h
        when Hash
          Hash[
            h.map { |k, v| [k.respond_to?(:to_sym) ? k.to_sym : k, recursive_symbolize_keys(v)] }
          ]
        when Enumerable
          h.map { |v| recursive_symbolize_keys(v) }
        else
          h
        end
      end
    end
  end
end
