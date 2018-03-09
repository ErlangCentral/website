<div class="article__sidebar__assets detail__sidebar__assets">
    <h3 class="article__sidebar__title">Subscribe to blogs</h3>
    <form class="form__inline article__sidebar__form" action="">
        <div class="input__wrapper">
            <input type="text" placeholder="your email">
            <input class="btn-default" type="submit" value="Subscribe">
        </div>
    </form>
    {% with m.rsc[id].author as author %}
        <p>{% if author %}{_ Author _}: <a href="{{ author.page_url }}">{% include 'person/fullname.tpl' id=author.id %}{% endif %}</a></p>

        {% if author.facebook or author.twitter %}
            <h3>Follow on social media</h3>
            <ul class="vacancy-post__content__company__social">
                {% if author.facebook %}
                    <li><a href="{{ author.facebook }}" class="main-footer__social__btn" target="_blank"><i class="facebook__icon"></i>Facebook</a></li>
                {% endif %}
                {% if author.twitter %}
                    <li><a href="{{ author.twitter }}" class="main-footer__social__btn" target="_blank"><i class="twitter__icon"></i>Twitter</a></li>
                {% endif %}
            </ul>
        {% endif %}
    {% endwith %}
</div>
<div class="vacancy-post__content__company__about">
</div>
