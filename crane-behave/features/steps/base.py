import httplib
import socket
import urllib2
import exceptions
import logging
__author__ = 'randalap'

_logger = logging.getLogger(__name__)


class RestUtils:
    @staticmethod
    def _get(url):
        """
        Gets data from a URL and handles various HTTP-related error conditions.
        Any test implementation that uses an HTTP-based backend service should
        be able to use this method for GET requests.

        :param url: a complete URL that will be used for a GET request
        :type  url: basestring

        :return:    the content of the response body
        :rtype:     basestring

        :raises exceptions.HTTPError:   if there is a problem performing the
                                        GET request.
                                        502: if the response is not 200
                                        503: if urllib2 raises an exception while
                                             performing the request
                                        504: if the backend takes too long
        """
        try:
            # one second timeout
            _logger.info(url)
            response = urllib2.urlopen(url, timeout=10)
        except socket.timeout:
            _logger.error('timeout communicating with backend search service')
            raise exceptions.Exception(httplib.GATEWAY_TIMEOUT)
        except urllib2.URLError, e:
            _logger.error('error communicating with backend search service: %s' % e.reason)
            raise exceptions.Exception(httplib.SERVICE_UNAVAILABLE)
        return response