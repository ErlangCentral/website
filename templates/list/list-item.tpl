{% extends "depiction/with_depiction.tpl" %}

{% block with_depiction %}

{% if id.is_visible %}
    {% with m.rsc[id].author as author %}
        <li class="list__item {{ extraClasses }} col-md-4">
            {% include "page-actions/page-action-edit-thing.tpl" extraClasses="edit-button--list-item" id=id %}
             <a href="{{ id.page_url }}" class="list__item__page-link" ></a>
            <article class="list__item__container">
                <div class="list__item__header {{ id.hasbanner.id|if:'has-image':'' }}  " style="background-image: url({% image_url id.hasbanner.id %})">
                    <div class="list__item__logo" style="background-image:url({% image_url author.o.depiction|last width=60 height=60 crop %})" ></div>
                    <div class="list__item__title">
                        <h3>{{ id.title }}</h3>
                        <p class="list__item__subtitle">{% if author %}{_ Author _}: {% include 'person/fullname.tpl' id=author.id %}{% endif %}</p>
                    </div>
                    <span class="btn-white list__item__category">{{ m.rsc[id.category.id].title }}</span>
                </div>
                <div class="list__item__content">
                    <p class="list__item__summary">{{ id|summary:175 }}</p>
                </div>
            </article>
        </li>
    {% endwith %}
{% endif %}

{% endblock %}
