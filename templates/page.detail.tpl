{% extends "page.tpl" %}

{% block page_header_title %}{% endblock %}

{% block header_content %}
    <div class="detail__header__content__wrapper">
        {% block header_content_detail %}{% endblock %}
    </div>
{% endblock %}

{% block page_class %}detail{% endblock %}

{% block page_content %}
    <div class="detail__content__info">
        <div class="detail__content__header" style="background-image: url({% image_url id.hasbanner.id %})" >
            <div class="detail__content__header__content">
                <h2>
                    {{id.title}}
                </h2>
                {% if id.publication_end %}
                    <p>Expire date: <span>{{id.publication_end|date:"Y-m-d"}}</span></p>
                {% endif %}
            </div>
        </div>
        <div class="text-wrapper detail__content-text-wrapper">
            {% include 'share/share.tpl' %}
            {{ id.body|show_media }}

            {% block disqus %}
            {% endblock %}
        </div>

    </div>

    <div class="detail__content__sidebar">
        {% block side_detail %}{% endblock %}
    </div>
{% endblock %}
