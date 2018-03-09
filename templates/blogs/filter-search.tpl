{% with ["blog_post","presentation_post","video_post"] as categories %}
    {% with (q.cat and q.cat != 'all')|if:q.cat:categories as cat %}
        {% with m.search[{ginger_search cat=cat pagelen=6 page=q.page}] as result %}
            {% include "list/list.tpl" class="list" list_id="list--query" list_template="list/list-item.tpl" items=result extraClasses="" id=id %}
        {% endwith %}
    {% endwith %}
{% endwith %}
