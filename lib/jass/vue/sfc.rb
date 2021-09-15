require 'jass/core'

require_relative 'sfc/version'
require_relative 'sfc/compiler'
require_relative 'sfc/processor'

if defined?(Sprockets) and Sprockets.respond_to?(:register_transformer)
  Sprockets.register_mime_type 'application/javascript', extensions: ['.vue.js'], charset: :unicode
  Sprockets.register_mime_type 'text/vue-sfc', extensions: %w[.vue], charset: :unicode
  Sprockets.register_transformer 'text/vue-sfc', 'application/javascript', Jass::Vue::SFC::Processor
end
