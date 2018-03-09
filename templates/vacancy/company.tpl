{% if m.rsc[id].hascompany %}
    {% with m.rsc[id].hascompany as company %}
        <div id="apply_now" class="fancybox__content" >
            {% include 'modals/apply-now.tpl' %}
        </div>
        <div class="vacancy-post__content__company__assets detail__sidebar__assets">
            <div class="vacancy-post__content__company__img" style="background-image:url({% image_url company.depiction width=130 height=130 crop %})" ></div>
            <h3>{{ company.title }}</h3>
            <span class="list__item-vertical__location"><i class="marker__icon--small"></i>{% include 'vacancy/company-adress.tpl' company=company %}</span>
            {% if m.acl.user %}
                <a href="#apply_now" class="btn-default lightbox">{_ Apply now _}</a>
            {% else %}
                <a href="#" id="{{ #signup }}" class="btn-default">{_ Apply now _}</a>

                {% wire
                    id=#signup
                    action={
                        dialog_open
                        title=title|default:(m.modules.active.mod_signup|if:_"Log in or sign up":_"Log in")
                        template=dialog_template|default:"_action_dialog_authenticate.tpl"
                        tab=tab|default:"logon"
                        redirect="#reload"
                        action=action
                    }
                %}
            {% endif %}
            <a href="{{ company.website }}" class="btn">{_ Visit company site _}</a>
            <ul class="vacancy-post__content__company__social">
                {% if company.facebook %}
                    <li><a href="{{ company.facebook }}" class="main-footer__social__btn" target="_blank"><i class="facebook__icon"></i>Facebook</a></li>
                {% endif %}
                {% if company.twitter %}
                    <li><a href="{{ company.twitter }}" class="main-footer__social__btn" target="_blank"><i class="twitter__icon"></i>Twitter</a></li>
                {% endif %}
            </ul>
        </div>
        <div class="vacancy-post__content__company__about">
            <p>{{ company.body|truncate:200 }}</p>
            <a class="link" href="{{ company.uri }}">{_ Read more _}</a>
        </div>
    {% endwith %}
{% endif %}
