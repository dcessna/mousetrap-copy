module Mousetrap
  class Promotion < Resource
    attr_accessor \
      :id,
      :coupon_code,
      :expiration_date

    def self.all
      response = get_resources plural_resource_name
      return [] unless response['promotions']
      build_resources_from response
    end

    protected

    def self.plural_resource_name
      'promotions'
    end

    def self.singular_resource_name
      'promotion'
    end

    def self.attributes_from_api(attributes)
      {
          :id              => attributes['id'],
          :coupon_code     => attributes['coupons']['coupon']['code'],
          :expiration_date => attributes['coupons']['coupon']['expirationDatetime']

      }
    end

  end
end