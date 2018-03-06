require 'digest/md5'

module IdentityCache
  module CacheHash

    if defined?(CityHash)

      def memcache_hash(key) #:nodoc:
        CityHash.hash64(key)
      end
    else

      def memcache_hash(key) #:nodoc:
        a = Digest::MD5.digest(key).unpack('LL')
        (a[0] << 32) | a[1]
      end
    end
  end
end
