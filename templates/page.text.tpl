{% extends "page.tpl" %}

{% block page_content %}
    <div class="main-content--text">
        <h3>{{ id.subtitle }}</h3>
        <p class="summary">{{ id.summary }}</p>
        <p>{{ id.body|show_media }}</p>
    </div>
{% endblock %}
