{% if not m.acl.user %}
    <a class="{{ class }} global_nav__login-btn" id="{{ #signup }}" href="#" title="{{ label }}">
    {% if icon == 'none' %}
        <span class="{{ label_class }}">{{ label }}</span>
    {% elseif icon %}
        <span class="global_nav__login-btn__wrapper"><i class="{{ icon }}"></i><span>log in</span></span>
    {% endif %}
    </a>

    {% wire
        id=#signup
        action = {
            show target='login'
        }
        action = {
            toggle target='global_van_dropdown'
        }
    %}
{% else %}
    <a href="#" id="{{ #profile }}" class="{{ class }} signed-in login global_nav__login-btn">
        <span class="global_nav__login-btn__wrapper">
            <i class="user__icon" ></i>
            <span>
                {% if m.rsc[m.acl.user].name_first %}
                    {{ m.rsc[m.acl.user].name_first|truncate:1:"" }}{{ m.rsc[m.acl.user].name_surname|truncate:1:"" }}
                {% endif %}
            </span>
        </span>
    </a>

    {% wire
        id=#profile
        action = {
            show target='logout'
        }
        action = {
            toggle target='global_van_dropdown'
        }
    %}
{% endif %}
{% include 'global-nav/global-nav-actions-dropdown.tpl' %}
