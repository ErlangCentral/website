{% extends "page.tpl" %}

{% block page_content %}
    <h3>{{ id.subtitle }}</h3>
    <p>{{ id.summary }}</p>
    {{ id.body }}

    {% include "_contact_form.tpl" %}
{% endblock %}
