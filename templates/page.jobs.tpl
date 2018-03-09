{% extends "page.tpl" %}

{% block header_content %}
    {% include "jobs/filter.tpl" %}
{% endblock %}

{% block page_content %}
    <div id="jobs_filter" class="wrapper listing-overlap">
        {% with m.search[{ginger_search cat="vacancy_post" pagelen=6 page=q.page}] as result %}
            {% include "jobs/filter-search.tpl" %}
        {% endwith %}
    </div>

    {%
        wire name="test"
        action={update template="jobs/filter-search.tpl" target="jobs_filter"}
    %}

    {% javascript %}
        $('#job_filter_form select').on('change', function(){
            var inputs = $('#job_filter_form select');
            z_event("test", {location: inputs[0].value, type: inputs[1].value, workplace: inputs[2].value});
        });
    {% endjavascript %}
{% endblock %}
