{% extends "base.tpl" %}

{% block body_class %}home{% endblock %}

{% block content %}
    <div class="page__header">
        <div class="container">
            <h1 class="home__title">{_ Erlang Developer Community _}</h1>
            <p class="home__slogan">
                {_ Join a community of Erlang enthusiasts who share a passion for building scalable, highly available, fault-tolerant and distributed systems _}
            </p>

            <div class="home__call-to-actions">
                <a class="btn-default btn-lg" href="{{ m.rsc.download_erlang.page_url }}">{_ Download _}</a>
                <a class="btn-white btn-lg" href="">{_ Join _}</a>
            </div>
        </div>
    </div>

    <div class="home__community">
        <div class="home-map">
            {% with m.search[{ginger_geo cat="person"}] as result %}
            {% include "map/map.tpl" overlaycolor="#d15675" disabledefaultui='true' container="map-results" result=result gridsize="40" zoom="1" %}
            {% endwith %}
        </div>
        <div class="home__community__join">
            <h2>{_ Our community _}</h2>
            <div class="home__community__join__stats">
                <div>


                </div>
            </div>
            <p class="intro">
                {_ Join the community of Erlang and become a member! _}
            </p>
            <div>
                <a class="btn-default" href="">{_ Join _}</a>
            </div>
        </div>
    </div>
    <div class="home__map-info" >
        {% with m.search[{query cat="person"}] as result %}
            <div class="home__community__join__stat">
                <img src="/lib/images/members_large.svg" alt="">
                <div>
                    <span class="home__community__join__stat__count">{{result|length}}</span>
                    {_ Members around the world _}
                </div>
            </div>
            {% with result|exclude:`address_country`:`undefined`|group_by:"address_country"|length as countries_count %}
            <div class="home__community__join__stat">
                <img src="/lib/images/countries.svg" alt="">
                <div>
                    <span class="home__community__join__stat__count">{{countries_count}}</span>
                    {_ Countries participated _}
                </div>
            </div>
            {% endwith %}
        {% endwith %}
    </div>
    <div class="home__recent-news">
        <h2>{_ Recent blogs _}</h2>

        {% with ["blog_post","presentation_post","video_post"] as categories %}
            {% with (q.cat and q.cat != 'all')|if:q.cat:categories as cat %}
                {% with m.search[{query cat=cat pagelen=3}] as result %}
                    {% include "list/list.tpl" class="list" showmore_button_text="View all" list_id="list--query" list_template="list/list-item.tpl" items=result extraClasses="" id=id %}
                {% endwith %}
            {% endwith %}
        {% endwith %}
        <div class="view-all__wrapper">
            <a href="/blogs" class="link">{_ View all _}</a>
        </div>
    </div>

    <div class="home__jobs">
        <h2>{_ New jobs _}</h2>

        {% with m.search[{query cat=["vacancy_post"] custompivot="vacancy" pagelen=3}] as result %}
            {% include "list/list.tpl" class="list--vertical" list_id="list--query" showmore_button_text="View all" list_template="list/list-item-vertical.tpl" items=result extraClasses="" id=id %}
        {% endwith %}
        <div class="view-all__wrapper">
            <a href="/jobs" class="link">{_ View all _}</a>
        </div>
    </div>

    <div class="home__user-group">
        <div class="home__user-group__text__wrapper">
            <h2>Erlang User Group</h2>
            <p class="home__user-group__text">{_ "The purpose of the Industrial Erlang User Group is to provide a forum allowing enterprise users of Erlang/OTP to work with Ericsson to secure the future health, wellbeing and commercial success of the Erlang programming language outside Ericsson." _}</p>
        </div>
        <div class="home__user-group__supporters">
            <div class="home__user-group__supporters__logo" style="background-image:url({% image_url supporter.depiction width=100 height=100 crop %})"></div>
            {% with m.search[{query cat='supporter'}] as result %}
                {% for supporter in result %}
                    <div class="home__user-group__supporters__logo" style="background-image:url({% image_url supporter.depiction width=100 height=100 crop %})"></div>
                {% endfor %}
            {% endwith %}
        </div>
        <div>
            <a class="btn" href="{{ m.rsc.erlang_user_group.page_url }}">{_ Read more _}</a>
        </div>
    </div>
{% endblock %}

