{% extends "page.tpl" %}

{% block body_class %}person{% endblock %}

{% block page__header %}
    <div class="person-top">
        {% if id.o.depiction %}
            <img src="{% image_url id.o.depiction|last mediaclass="avatar" %}">
        {% endif %}

        <div class="person-top__name">
            <h1>{% include 'person/fullname.tpl' id=id %}</h1>
            {% include "subtitle/subtitle.tpl" id=id %}
        </div>
    </div>

{% endblock %}

{% block page_content %}
    <main>
        <div class="foldout">
            <article class="main-content">
                <div class="row">
                    <div class="col-sm-3">
                        {% if id.facebook or id.twitter or id.github or id.linkedin %}
                            <ul class="person-social">
                                {% if id.facebook %}
                                    <li><a href="{% include "add_https.tpl" val=id.facebook %}" target="_blank"><i class="facebook__icon"></i></a></li>
                                {% endif %}
                                {% if id.twitter %}
                                    <li><a href="{% include "add_https.tpl" val=id.twitter %}" target="_blank"><i class="twitter__icon"></i></a></li>
                                {% endif %}
                                {% if id.github %}
                                    <li><a href="{% include "add_https.tpl" val=id.github %}" target="_blank"><i class="github__icon"></i></a></li>
                                {% endif %}
                                {% if id.linkedin %}
                                    <li><a href="{% include "add_https.tpl" val=id.linkedin %}" target="_blank"><i class="icon-site--linkedin"></i></a></li>
                                {% endif %}
                            </ul>
                        {% endif %}

                        <ul class="person-meta">
                            {% if id.address_city or id.address_country %}
                                <li><i class="marker__icon--small"></i>{% if id.address_city %}{{ id.address_city }}{% endif %}{% if id.address_country %}{% if id.address_city %}, {% endif %} <span>{{ id.address_country }}</span>{% endif %}</li>
                            {% endif %}
                            {% if id.website %}
                                <li><a href="{{ id.website }}" target="_blank"><i class="icon-site--link"></i>{_ Website _}</a></li>
                            {% endif %}
                            {% if id.erlang_since %}
                                <li><i class="icon-site--clock"></i> Using Erlang since: {{ id.erlang_since }}</li>
                            {% endif %}
                        </ul>
                    </div>
                    <div class="col-sm-9 person-about">
                        {% if id.body %}
                            <h3 class="person-about__title">About {{ id.name_first }}</h3>
                            {{ id.body }}
                        {% endif %}
                    </div>
                    {% if id.is_editable %}
                        <a href="{% url edit_profile id=id %}" class="btn-default person-about_edit">{_ Edit profile _}</a>
                    {% endif %}
                </div>
            </article>
        </div>

        {% with (id==m.acl.user)|if:"all":"true" as is_published %}
        <aside class="main-aside">
            {% with m.search[{ginger_search hasobject=[id,'author'] is_published=is_published cat="vacancy_post" sort='-rsc.modified'}] as result %}

            {% include "list/list-header.tpl" id=id list_title="Jobs added by "++id.title items="true"  %}

            {% include "list/list-profile-jobs.tpl" list_id="list--authored" items=result extraClasses="" default_items="true" id=id %}

            {% endwith %}
        </aside>

        <aside class="main-aside">

            {% with m.search[{ginger_search hasobject=[id,'author'] is_published=is_published cat="blog_post" sort='-rsc.modified'}] as result %}

            {% include "list/list-header.tpl" id=id list_title="Blogs authored by "++id.title items="true" %}

            {% include "list/list-profile-blogs.tpl" list_id="list--authored" items=result extraClasses="" default_items="true" id=id %}

            {% endwith %}
        </aside>
        {% endwith %}
    </main>
{% endblock %}
