{% extends "page.tpl" %}

{% block body_class %}blog{% endblock %}

{% block header_content %}
    {% include "blogs/filter.tpl" %}
{% endblock %}

{% block page_content %}
    <div id="jobs_filter" class="wrapper listing-overlap">
        {% with m.search[{ginger_search cat="vacancy_post" pagelen=6 page=q.page}] as result %}
            {% include "blogs/filter-search.tpl" %}
        {% endwith %}
    </div>

    {%
        wire name="filter_blogs"
        action={update template="blogs/filter-search.tpl" target="jobs_filter"}
    %}

    {% javascript %}
        $('#filter_form_check').on('change', function(){
            z_event("filter_blogs", {cat: this.value});
        });
    {% endjavascript %}
{% endblock %}
