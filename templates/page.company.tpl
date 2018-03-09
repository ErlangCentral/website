{% extends "page.tpl" %}

{% block page_content %}
<div class="company-page__info">
    <div class="compane-page__logo" style="background-image: url({% image_url id.depiction %})"></div>
    <span class="list__item-vertical__location compane-page__location"><i class="marker__icon--small"></i>{% include 'vacancy/company-adress.tpl' company=id %}</span>
    <div class="text-wrapper detail__content-text-wrapper">

        {{ id.body }}

        {% if id.website or id.facebook or id.twitter %}
        <h3>{_ More information _}</h3>
        {% endif %}
        {% if id.website %}
        <a href="{{ id.website }}">Website</a><br/>
        {% endif %}
        {% if id.facebook %}
        <a href="{{ id.facebook }}">Facebook</a><br/>
        {% endif %}
        {% if id.twitter %}
        <a href="{{ id.twitter }}">Twitter</a>
        {% endif %}
    </div>
</div>

{% endblock %}
