<nav class="global-nav do_global_nav">

    {% block logo %}
        {% include "logo/logo.tpl" class="global-nav__logo" %}
    {% endblock %}

    {% block menu %}
        <div class="global-nav__menu__wrapper">
            {% include "search-suggestions/search.tpl" extraFormClassess="global-nav__mobile-search" identifier="global-nav" %}
            {% menu id=id %}
        </div>
    {% endblock %}

    {% block actions %}
        {% include "global-nav/global-nav-actions.tpl" %}
    {% endblock %}
</nav>
