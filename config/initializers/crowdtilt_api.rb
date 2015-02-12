module Crowdtilt

  class << self

    attr_accessor :api_key, :api_secret, :mode, :base_url, :version

    def configure(params)
      raise ArgumentError, "You must include both the api_key and api_secret" unless (params.include?(:api_key) && params.include?(:api_secret))
      @api_key = params[:api_key]
      @api_secret = params[:api_secret]

      @version = 'v1'

      if params[:mode] == 'production'
        @mode = 'production'
        @base_url = 'https://api.crowdtilt.com'
      else
        @mode = 'sandbox'
        @base_url = 'https://api-sandbox.crowdtilt.com'
      end

      @base_url = params[:base_url] if params[:base_url]
      @version = params[:version] if params[:version]

      true
    end

    def get(string)
      # request :get, uri(string)
    end

    def post(string, params={})
      # request :post, uri(string), params
    end

    def put(string, params={})
      # request :put, uri(string), params
    end

    def delete(string)
      # request :delete, uri(string)
    end

    def get_users()
      # get("/users")['users']
    end

    def get_user(id)
      # get("/users/#{id}")['user']
    end

    def create_user(user)
      # post("/users", { :user => user })['user']
    end

    def update_user(id, user)
      # put("/users/#{id}", { :user => user })['user']
    end

    # private
    #
    # def request(method,*args)
    #   conn = Faraday.new(:url => @base_url) do |faraday|
    #     # faraday.response :logger
    #     faraday.request :json
    #     faraday.response :json, :content_type => /\bjson$/
    #     faraday.use :instrumentation
    #     faraday.adapter Faraday.default_adapter
    #   end
    #   conn.basic_auth(@api_key, @api_secret)
    #   conn.headers.update({'Content-Type' => 'application/json'})
    #
    #   res = conn.send method.to_sym, *args
    #
    #   case res.status
    #     when 401
    #       raise "Invalid credentials"
    #     when 400...599
    #       if res.body.include? 'error'
    #         raise res.body['error']
    #       else
    #         raise 'Unknown error'
    #       end
    #     else
    #       res.body
    #   end
    # end
    #
    # def uri(string)
    #   if string =~ /^\/v/
    #     string
    #   elsif string =~ /^v/
    #     '/' + string
    #   elsif string =~ /^\//
    #     "/#{@version}" + string
    #   else
    #     "/#{@version}/" + string
    #   end
    # end

    def createBankGivenAUser(user_id,bankHash)
    end

    def getBankGivenAUser(user_id)
    end

    def deleteBankGivenAUser(user_id, bank_id)
    end

    def getUser(user_id)
    end

    def verifyUser(user_id)
    end

    def updateUser(user_hash)
    end

    def refundPaymentGivenACampaign(campaign_id, payment_id)
    end

    def getUsers
    end
    
  end

end

module Crowdtilt

  def self.sandbox
    self.configure api_key: Rails.configuration.crowdtilt_sandbox_key,
                   api_secret: Rails.configuration.crowdtilt_sandbox_secret,
                   mode: 'sandbox'
  end

  def self.production(settings)
    self.configure api_key: settings.ct_prod_api_key,
                      api_secret: settings.ct_prod_api_secret,
                      mode: 'production'
  end

end

# Initialize sandbox mode by default
Crowdtilt.sandbox
