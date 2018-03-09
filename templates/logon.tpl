{% extends "base.tpl" %}

{% block html_head_extra %} {% endblock %}

{% block body_class %}t--login{% endblock %}
{% block global_nav %} {% endblock %}

{% block title %}
{{ m.rsc.page_logon.title|default:[_"Sign in to", " ", m.config.site.title.value|default:"Zotonic"] }}
{% endblock %}

{% block content_area %}
	<a href="/" class="login-logo"></a>
    {% include
        "_logon_config.tpl"
        logon_modal=0
    %}
{% endblock %}
