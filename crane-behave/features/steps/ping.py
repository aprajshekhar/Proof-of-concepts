import logging
from behave import given, then
from behave import when
from .base import RestUtils

__author__ = 'randalap'


_logger = logging.getLogger(__name__)


@given(u'Registry exists that supports status check')
def step_impl(context):
    pass


@when(u'I check the status')
def step_impl(context):
    host_url = context.config.userdata.get("server")
    _logger.info('server: %s' % context.config)
    context.response = RestUtils._get(host_url+"/v1/_ping")


@then(u'I should get a 200')
def step_impl(context):
    assert context.response.getcode() == 200


@then(u'the response should contain true')
def step_impl(context):
    assert context.response.read() == "true"

