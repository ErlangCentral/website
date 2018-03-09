{% with
    q.location|default:'all',
    q.type|default:'all',
    q.workplace|default:'all'
    as
    location,
    type,
    workplace
%}
    {% with
        (location=='all')|if:'<>':'=',
        (type=='all')|if:'<>':'=',
        (workplace=='all')|if:'<>':'='
        as
        location_check,
        type_check,
        workplace_check
    %}
        {% with m.search[{ginger_search cat=["vacancy_post"] custompivot="vacancy" filter=["workplace", workplace_check, workplace] filter=["location", location_check, location]  filter=["type", type_check, type] pagelen=6 page=q.page}] as result %}
            {% include "list/list.tpl" class="list--vertical" list_id="list--query" list_template="list/list-item-vertical.tpl" items=result extraClasses="" id=id %}
        {% endwith %}

    {% endwith %}
{% endwith %}
