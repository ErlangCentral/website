{% extends "page.detail.tpl" %}

{% block page_header_title %}{{ m.rsc[id.category.id].title }}{% endblock %}

{% block header_content_detail %}
    <a href="/blogs" class="btn-white"><i class="chevron__icon"></i>Back to blogs</a>
{% endblock %}

{% block side_detail %}
    {% include 'article/extra-info.tpl' %}
{% endblock %}

{% block disqus %}
    {% if m.config.site.disqus.value and (id.is_a.blog_post or id.is_a.presentation_post or id.is_a.video_post) %}
        <div id="disqus_thread"></div>
        <script>
            var disqus_config = function () {
                this.page.url = "https://{{ m.req.host }}/page/{{ id }}";
                this.page.identifier = {{ id }};
            };

            (function() {
                var d = document, s = d.createElement('script');
                s.src = 'https://{{ m.config.site.disqus.value }}.disqus.com/embed.js';
                s.setAttribute('data-timestamp', +new Date());
                (d.head || d.body).appendChild(s);
            })();
        </script>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    {% endif %}
{% endblock %}
