require "yaleldap/version"
require "net-ldap"

#YaleLDAP Module is xyz
module YaleLDAP
  # Yale's LDAP Host
  LDAP_HOST = 'directory.yale.edu'

  # Yale's LDAP Port
  LDAP_PORT = 389

  # Specify to LDAP that we are searching for people
  LDAP_BASE = 'ou=People,o=yale.edu'

  # The most common Yale LDAP atttributes that we care about extracting
  LDAP_ATTRS = %w(uid givenname sn mail collegename college class UPI)

  ##
  # Lookup LDAP information by UPI
  # 
  # @param
  #   UPI as a string, ex "12714662"
  #
  # @return
  #   Standard hash (see extract_attributes)
  # 
  # @example
  #   YaleLDAP.lookup_by_upi("12714662")

  def self.lookup_by_upi(upi)
    ldap = Net::LDAP.new host: LDAP_HOST, port: LDAP_PORT
    upifilter = Net::LDAP::Filter.eq('UPI', upi)
    ldap_response = ldap.search(base: LDAP_BASE,
                     filter: upifilter,
                     attributes: LDAP_ATTRS)
    extract_attributes(ldap_response)
  end

  ##
  # Lookup LDAP information by netid
  # 
  # @param
  #   netid as a string, ex "csw3"
  #
  # @return
  #   Standard hash (see extract_attributes)
  # 
  # @example
  #   YaleLDAP.lookup_by_netid("csw3")
  #
  def self.lookup_by_netid(netid)
    ldap = Net::LDAP.new host: LDAP_HOST, port: LDAP_PORT
    upifilter = Net::LDAP::Filter.eq('uid', netid)
    ldap_response = ldap.search(base: LDAP_BASE,
                     filter: upifilter,
                     attributes: LDAP_ATTRS)
    extract_attributes(ldap_response)
  end

  ##
  # Lookup LDAP information by Yale email address
  # 
  # @param
  #   email as a string, ex "casey.watts@yale.edu"
  #
  # @return
  #   Standard hash (see extract_attributes)
  # 
  # @example
  #   YaleLDAP.lookup_by_email("casey.watts@yale.edu")
  #
  def self.lookup_by_email(email)
    ldap = Net::LDAP.new host: LDAP_HOST, port: LDAP_PORT
    upifilter = Net::LDAP::Filter.eq('mail', email)
    ldap_response = ldap.search(base: LDAP_BASE,
                     filter: upifilter,
                     attributes: LDAP_ATTRS)
    extract_attributes(ldap_response)
  end

private
  #
  # Input a raw LDAP response
  #
  # Output is a hash with keys: first_name, last_name, upi, netid, email, collegename, college, class_year
  #
  def self.extract_attributes(ldap_response)
    # everyone has these
    first_name = ldap_response[0][:givenname][0]
    last_name = ldap_response[0][:sn][0]
    upi = ldap_response[0][:UPI][0]

    # not everyone has these
    netid = ldap_response[0][:uid][0] || ""
    email = ldap_response[0][:mail][0] || ""
    collegename = ldap_response[0][:collegename][0] || ""
    college = ldap_response[0][:college][0] || ""
    class_year = ldap_response[0][:class][0] || ""

    return {
      first_name: first_name,
      last_name: last_name,
      yale_upi: upi,
      netid: netid,
      email: email,
      collegename: collegename,
      college: college,
      class_year: class_year
    }
  end

end