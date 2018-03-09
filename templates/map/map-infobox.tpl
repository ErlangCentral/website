{% if results|length == 1 %}
        <div class="infobox-wrapper">
            <a href="{{ results.page_url }}">
                <div class="infobox-wrapper__icon" ></div>
                {% for id in results %}
                    {{ id.name_first }}
                {% endfor %}
            </a>
        </div>
{% else %}
    <ul class="infobox-wrapper">
        <div class="infobox-wrapper__icon" ></div>
        <div class="infobox-wrapper_list__wrapper">
            {% for id in results %}
                <li>
                    <a href="{{ id.page_url }}">
                        <div>
                            {{ id.name_first }}
                        </div>
                    </a>
                </li>
            {% endfor %}
        </div>
    </ul>
{% endif %}
