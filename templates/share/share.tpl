<div class="share">
    {% block button %}
        <div class="share__button">
            <span class="btn-black">{_ Share _}</span>

             {% block menu %}
                <ul class="share__menu">
                    <li>
                        <a href="http://www.facebook.com/sharer.php?u=http%3A%2F%2F{{ m.site.hostname }}{{ id.page_url|urlencode }}&amp;t={{ id.title|urlencode }}" onclick="return !window.open(this.href, 'Facebook', 'width=600,height=500,toolbar=0,location=0,scrollbars=0,status=0')" title="Facebook" class="">{_ Facebook _}</a>
                    </li>
                    <li>
                        <a href="https://twitter.com/intent/tweet?text={{ id.title|urlencode  }}%20http%3A%2F%2F{{ m.site.hostname }}{{ id.page_url|urlencode }}&amp;t={{ id.title|urlencode }}" onclick="return !window.open(this.href, 'Twitter', 'width=600,height=300,location=0,toolbar=0,scrollbars=0,status=0')" title="Twitter" class="">{_ Twitter _}</a>
                    </li>
                    <li>
                        <a href="https://www.linkedin.com/shareArticle?mini=true&amp;title={{ id.title|urlencode }}&amp;url={{ id.page_url_abs|urlencode }}" onclick="return !window.open(this.href, 'LinkedIn', 'width=600,height=300,location=0,toolbar=0,scrollbars=0,status=0')" title="LinkedIn" class="">{_ LinkedIn _}</a>
                    </li>
                    <li>
                        <a href="mailto:?subject={{ id.title|urlencode }}&amp;body={{ id.page_url_abs|urlencode }}" title="{_ E-mail _}" class="">{_ E-mail _}</a>
                    </li>

                    {% block other %}
                        {% all include "share/share-link.tpl" %}
                    {% endblock %}
                </ul>
            {% endblock %}
        </div>
    {% endblock %}
</div>
