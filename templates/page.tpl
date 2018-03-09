{% extends "base.tpl" %}

{% block content %}
    <div class="page__header">
        <div class="container">
            {% block page__header %}
                <h1>{% block page_header_title %}{{ id.title }}{% endblock %}</h1>
                <div class="page__header__content" >
                    {% block header_content %}{% endblock %}
                </div>
            {% endblock %}
        </div>
    </div>
    <main class="container page {% block page_class %}{% endblock %}">
        {% block page_content %}{% endblock %}
    </main>
{% endblock %}
