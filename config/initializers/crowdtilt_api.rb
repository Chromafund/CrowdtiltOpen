module Crowdtilt

  class << self

    attr_accessor :mode, :version

    def configure(params)

      @version = 'v1'

      if params[:mode] == 'production'
        @mode = 'production'
      else
        @mode = 'sandbox'
      end

      @base_url = params[:base_url] if params[:base_url]
      @version = params[:version] if params[:version]

      true
    end

  end

end

module Crowdtilt

  def self.sandbox
    self.configure mode: 'sandbox'
  end

  def self.production(settings)
    self.configure mode: 'production'
  end

end

# Initialize sandbox mode by default
Crowdtilt.sandbox
