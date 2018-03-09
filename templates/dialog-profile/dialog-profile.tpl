{% if m.acl.user %}

    {% with m.rsc[m.acl.user] as user %}

        {% block avatar %}
            <a class="dialog-profile__avatar" href="{{ user.page_url }}">
                {% include
                    "avatar/avatar.tpl"
                    id=m.rsc[m.acl.user]
                    fallback_rsc_id=m.rsc.custom_avatar_fallback.id
                %}
            </a>
        {% endblock %}

        {% block title %}
            <a class="dialog-profile__title" href="{{ user.page_url }}">
                {_ Hi, _} {% include 'person/fullname.tpl' id=user truncate %}
            </a>
        {% endblock %}

        {% block controls %}
            <div class="login__controls">
                <a href="{{ user.page_url }}" class="btn" >{_ View Profile _}</a>
                <a href="{% url logoff %}" class="btn-default" >{{ logoff_label|if_undefined:_"Sign out" }}</a>
            </div>
        {% endblock %}

    {% endwith %}

{% endif %}
