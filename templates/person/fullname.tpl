{% with id as id %}
    {% if id.name_first %}
        {{ id.name_first }}
    {% endif %}
    {% if id.name_surname_prefix %}
        {{ id.name_surname_prefix }}
    {% elif id.name_middle %}
        {{ id.name_middle }}
    {% endif %}
    {% if id.name_surname %}
        {{ id.name_surname }}
    {% endif %}
{% endwith %}
