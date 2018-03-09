{% extends "page.article.tpl" %}

{% block page_header_title %}Jobs{% endblock %}

{% block header_content_detail %}
    <a href="/jobs" class="btn-white"><i class="chevron__icon"></i>Back to jobs</a>
{% endblock %}

{% block side_detail %}
    {% include 'vacancy/company.tpl' %}
{% endblock %}
