{% with val as val %}
    {% if not val|match:'https' or not val|match:'https' %}
        https://{{ val }}
    {% else %}
        {{ val }}
    {% endif %}
{% endwith %}
