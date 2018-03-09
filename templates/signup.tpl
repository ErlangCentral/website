{% extends "base.tpl" %}

{% block title %}{_ Sign Up _}{% endblock %}
{% block body_class %}t--login{% endblock %}
{% block global_nav %} {% endblock %}

{% block content_area %}
	<a href="/" class="login-logo"></a>
    {% include "_signup_config.tpl" %}
{% endblock %}
