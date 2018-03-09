{% extends "depiction/with_depiction.tpl" %}

{% block with_depiction %}
{% if id.is_visible %}
    {% with m.rsc[id].hascompany as company %}
        <li class="list__item-vertical {{ extraClasses }}">
            <a href="{{ id.page_url }}">
                <article class="row">
                    <div class="col-md-2">
                        <div class="list__item-vertical__logo" style="background-image:url({% image_url company.depiction width=100 height=100 crop %})" ></div>
                    </div>
                    <div class="col-md-10 list__item-vertical__content">
                        {% if company.address_city or company.address_country %}
                            <span class="list__item-vertical__location"><i class="marker__icon--small"></i>{% include 'vacancy/company-adress.tpl' company=company %}</span>
                        {% endif %}
                        <h3 class="list__item-vertical__content__title">
                            {% if id.short_title %}
                                {{ id.short_title }}
                            {% else %}
                                {{ id.title }}
                            {% endif %}
                        </h3>
                        {% block summary %}
                            <p>{{ id|summary:400 }}</p>
                        {% endblock %}
                    </div>
                </article>
            </a>
        </li>
    {% endwith %}
{% endif %}

{% endblock %}
