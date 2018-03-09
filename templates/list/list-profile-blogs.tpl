{% extends "list/list.tpl" %}

{% block prefix_list_item %}
    {% if m.acl.user %}
        <li class="list__item {{ extraClasses }} col-md-4">
            <a href="/add/blog" class="btn--add-resource"><span>+</span> Add Blog</a>
        </li>
    {% endif %}
{% endblock %}