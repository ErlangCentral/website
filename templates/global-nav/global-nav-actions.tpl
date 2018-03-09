{% include "toggle-menu/toggle-menu.tpl" %}
{% include "search-suggestions/search.tpl" identifier="global-nav" %}
<div class="global-nav__actions cf">
    {% include "search-suggestions/toggle-search.tpl" %}
    <a class="global-nav__notification" href=""><i class="notification__icon"></i></a>
    {% include "dialog-profile/button-profile.tpl" %}
    {% include "dialog-language/button-language.tpl" raw_path=m.req.raw_path %}
    {% include "_auth_link.tpl" class="global-nav__login" label_class=" " icon="user__icon" icon_before %}
</div>
